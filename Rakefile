ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'carrierwave/orm/activerecord' 
task :console do
  Pry.start
end
