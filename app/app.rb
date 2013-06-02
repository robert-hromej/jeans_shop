# encoding: utf-8
#require 'json'
#require 'compass'
#require 'lib/topic_list'
#require 'lib/bot_detection'
#require 'digest/md5'

class JeansShopApp < Sinatra::Base
  #set :root, File.dirname(__FILE__)
  #set :haml, :layout => :'layouts/application'
  #register Sinatra::Pebblebed
  #i_am :dittforslag
  #
  #declare_pebbles do
  #  service :dittforslag
  #end
  #
  #ORIGO_COOKIE_NAME = 'origo_user'
  #ORIGO_API_KEY = '4ltp99v8jo6z6nh4vk73q83y3iy2jnq2f5gw1k1od84eep7frd'
  #
  ## Settings for blog excerpt
  #BLOG_FEED_URL = "http://origo.no/-/feed/global/sandbox/235303?as=68b5c20993f1429cf05a8dada79e15bcg4"
  #
  #MAX_TITLE_CHARACTERS = 50
  #MAX_BODY_CHARACTERS = 200
  #
  #DEFAULT_META = {
  #  :title => "Ditt Forslag",
  #  :description => "Vil du delta i Norges mest spennende politiske verksted? På dittforslag.no inviterer Arbeiderpartiet deg til den bredeste politiske debatten i norsk historie. På få sekunder kan du komme med ditt forslag, stemme opp forslag du liker, og vise hvilke forslag som er mindre viktige for deg.",
  #  :thumbnail => "http://dittforslag.no/assets/sharing_logo-bc040d4ebf4a688c38a7b47da10a7607.png"
  #}
  #
  #helpers do
  #  include Sprockets::Helpers
  #
  #  def digest_for_origo_user(value)
  #    Digest::MD5.hexdigest("Who hears a who? #{value}")
  #  end
  #
  #  def set_origo_user(value)
  #    @origo_user = value
  #    if value
  #      response.set_cookie('origo_user', "#{value}-#{digest_for_origo_user(value)}")
  #    else
  #      response.set_cookie('origo_user', "")
  #    end
  #  end
  #
  #  def current_origo_user
  #    return @origo_user if @origo_user
  #    return nil unless request.cookies['origo_user']
  #    value, digest = request.cookies['origo_user'].split('-')
  #    return nil unless value && digest == digest_for_origo_user(value)
  #    @origo_user = value.to_i
  #  end
  #
  #  # Check if the current origo user is a party person
  #  def origo_user_is_labor_party_member?
  #    return false unless current_origo_user
  #    # Read status through memcached. The cache is kept for 30 minutes.
  #    is_member = $memcached.fetch("id_dna_member:#{current_origo_user}", 60*30) do
  #      result = false
  #      # Fetch credentials from origo
  #      resp = HTTPClient.new.get(
  #        "http://origo.no/-/api/v2/credential/find?user_id=#{current_origo_user}&include_organization=true&format=json&api_key=#{ORIGO_API_KEY}")
  #      raise "#{resp.status} #{resp.body} from origo when fetching credentials" unless resp.status == 200
  #      # Look for any membership in arbeiderpartiet (organization id 6)
  #      JSON.parse(resp.body).each do |record|
  #        if record['organization']['id'] == 6
  #          result = true
  #          break
  #        end
  #      end
  #      result.to_s
  #    end
  #    return is_member == 'true'
  #  end
  #
  #  def current_url
  #    "http://#{request.host}#{request.env['REQUEST_URI']}"
  #  end
  #
  #  # If there is no cookie named 'origo_user' this redirects to origo to check if
  #  # the user is logged in there. Origo redirects back with the required info. Then
  #  # set the cookie. Slip this at the top of methods that require an origo session.
  #  def check_origo_session
  #    return if user_agent_bot?
  #    if params['status']
  #      set_origo_user(params['user_id'])
  #      redirect "http://#{request.host}#{request.env['REQUEST_PATH']}"
  #    elsif request.cookies['origo_user'].nil?
  #      redirect "http://origo.no/-/api/v2/auth/check_session?return_url=#{CGI.escape(current_url)}&api_key=#{ORIGO_API_KEY}"
  #    end
  #  end
  #
  #  def sanitize_and_truncate_text(body, character_target)
  #    words = Sanitize.clean(body.gsub(/\s+/, ' ').gsub(/\<div.class\=\"feed_author.*$/i,'')).split(/\s+/)
  #    result = []
  #    result << words.shift while !words.empty? && result.join(' ').size < character_target
  #    result << "&hellip;" unless words.empty?
  #    result.join(' ')
  #  end
  #
  #  # User agent is bot?
  #  def user_agent_bot?(agent = request.env["HTTP_USER_AGENT"])
  #    BotDetection.user_agent_bot?(agent)
  #  end
  #end
  #
  #before do
  #  # Issue a provisional identity by default
  #  unless request.path_info == '/ping' || user_agent_bot?
  #    if current_identity.nil?
  #      redirect "/api/checkpoint/v1/login/anonymous?redirect_to=#{request.env['REQUEST_PATH']}"
  #    end
  #  end
  #end
  #
  #get "/who" do
  #  check_origo_session
  #  result = "You are: #{current_origo_user.inspect}, "
  #  if origo_user_is_labor_party_member?
  #    result << "and you, my friend, is a member of Arbeiderpartiet."
  #  else
  #    result << "and you, you infidel, is not a member of Arbeiderpartiet."
  #  end
  #  [200, result]
  #end
  #
  #get '/' do
  #  check_origo_session
  #  topics = TopicList.new(pebbles)
  #  current = topics.current
  #  if topics.current
  #    current_topic_uid = current.post.uid
  #    klass, path, oid = Pebblebed::Uid.parse current_topic_uid
  #    suggestions_uid = Pebblebed::Uid.new(:klass => klass, :path => "#{path}_#{oid}", :oid => "*")
  #  else
  #    current_topic_uid = suggestions_uid = nil
  #  end
  #  haml :topic, :locals => {:suggestions_uid => suggestions_uid, :current_topic_uid => current_topic_uid, :og_meta => DEFAULT_META}
  #end
  #
  #get %r{/topic/(\d+)\-?\w*/(\d+)\-\w*} do |topic_id, suggestion_id|
  #  check_origo_session
  #  topics = TopicList.new(pebbles)
  #  current = topics.current
  #  suggestion_uid = suggestion_id_to_uid suggestion_id
  #  suggestion = (pebbles.grove.get "/posts/#{suggestion_uid}").post
  #
  #  og_meta = { #opengraph meta
  #    :thumbnail => DEFAULT_META[:thumbnail],
  #    :title => "#{suggestion.document.author_name} har et forslag til Arbeiderpartiets politikk",
  #    :description => "\"#{suggestion.document.text}\"",
  #  }
  #  haml :suggestion, :locals => {
  #    :suggestion => suggestion,
  #    :og_meta => og_meta,
  #    :suggestions_uid => suggestion_uid,
  #    :current_topic_uid => current.post.uid,
  #    :permalink => true
  #  }
  #end
  #
  #get %r{/topic/(\d+)\-\w*} do |topic_id|
  #  check_origo_session
  #  current_topic_uid = topic_id_to_uid topic_id
  #  klass, path, oid = Pebblebed::Uid.parse current_topic_uid
  #  suggestions_uid = Pebblebed::Uid.new(:klass => klass, :path => "#{path}_#{oid}", :oid => "").to_s
  #  suggestions_uid << "$*"
  #  haml :topic, :locals => {:suggestions_uid => suggestions_uid, :current_topic_uid => current_topic_uid, :og_meta => DEFAULT_META}
  #end
  #
  #get "/blog_as_json" do
  #  is_member = origo_user_is_labor_party_member?
  #  $memcached.fetch("dna_dittforslag_blog_feed_#{is_member}", 60*15) do
  #    # The final product shall fetch blog from sandbox 1334939
  #    feed = Feedzirra::Feed.fetch_and_parse(
  #      BLOG_FEED_URL)
  #    posts = feed.entries.map do |entry|
  #      { title: sanitize_and_truncate_text(entry.title, MAX_TITLE_CHARACTERS),
  #        url: entry.url,
  #        author: entry.author,
  #        avatar: entry.avatar,
  #        created_at: entry.updated.try(:utc),
  #        # Remove html, newlines, double spaces and origo cruft and truncate to max 2000 characters
  #        content: sanitize_and_truncate_text(entry.content, MAX_BODY_CHARACTERS),
  #        restricted: entry.visibility == 'restricted'
  #      } if is_member || entry.visibility == 'everyone'
  #    end.compact
  #    posts.to_json
  #  end
  #end
  #
  #get '/ping' do
  # 'dittforslag'
  #end
  #
  #private
  #def topic_id_to_uid(id)
  #  "post:mittap.dittforslag.topic$#{id}"
  #end
  #def suggestion_id_to_uid(id)
  #  "post:mittap.dittforslag.suggestion$#{id}"
  #end
end
