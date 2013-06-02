# encoding: utf-8
#require 'json'
#require 'compass'

class JeansShopAdmin < Sinatra::Base
  set :root, File.dirname(__FILE__)
  #set :haml, :layout => :'layouts/admin'

  #helpers do
  #  include Sprockets::Helpers
  #  def to_mustache(template)
  #    Fu.to_mustache File.read(File.join("app", "views", template))
  #  end
  #end
  #
  #get '/' do
  #  redirect to('../login') if current_identity.nil?
  #  redirect to('../login?msg=no_access') unless current_identity.god
  #  haml :dashboard
  #end
  #
end
