$:.unshift(File.dirname(__FILE__))

require 'sinatra/activerecord/rake'

task(:environment) { require 'config/environment' }

namespace :db do

  desc 'bootstrap db user, recreate, run migrations'
  task :bootstrap do
    name = 'jeans_shop'
    `dropdb #{name}_development`
    `createuser -sdR #{name}`
    `createdb -O #{name} #{name}_development`
    Rake::Task['db:migrate'].invoke
    #Rake::Task['db:test:prepare'].invoke
  end

  task migrate: :environment do
    #Rake::Task['db:structure:dump'].invoke
  end

  desc 'nuke db, recreate, run migrations'
  task :nuke do
    name = 'jeans_shop'
    `dropdb #{name}_development`
    `createdb -O #{name} #{name}_development`
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    #Rake::Task['db:test:prepare'].invoke
  end

  desc 'add seed data to database'
  task seed: :environment do
    require_relative './db/seeds'
  end
end

