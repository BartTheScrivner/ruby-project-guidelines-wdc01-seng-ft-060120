require 'bundler'
require 'sinatra/activerecord'
Bundler.require
require_all 'app/models'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil