$:.unshift(File.dirname(__FILE__))
require 'config/environment'

ENV['RACK_ENV'] ||= 'development'
set :environment, ENV['RACK_ENV'].to_sym

use Rack::CommonLogger

map "/api/v1" do
  run JeansShopV1
end

map "/admin" do
  run JeansShopAdmin
end

map "/" do
  run JeansShopApp
end

map "/assets" do
  #environment = Sprockets::Environment.new
  #environment.append_path 'public/assets'
  #stylesheet_path = 'app/assets/stylesheets'
  #environment.append_path stylesheet_path
  #Dir.glob("#{stylesheet_path}/**/*").each do |dir|
  #  environment.append_path dir if File.directory? dir
  #end
  #
  #environment.append_path 'app/assets/javascripts'
  #
  #Sprockets::Helpers.configure do |config|
  #  config.environment = environment
  #  config.prefix      = "/assets"
  #  config.digest      = true
  #end
  #run environment
end
