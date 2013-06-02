require 'bundler'
Bundler.require

%w(api app).each do |dir|
  Dir.glob("./#{dir}/**/*.rb").each { |lib| require lib }
end

require 'config/logging'

ENV['RACK_ENV'] ||= 'development'
environment = ENV['RACK_ENV']

$config = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection($config[environment])

Dir.glob('./lib/**/*.rb').each { |lib| require lib }
