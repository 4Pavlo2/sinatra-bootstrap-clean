#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require "sinatra/activerecord"


set :database, { adapter: 'sqlite3', database: 'barbers.db' }
#set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
#set :database, "sqlite:barbers.db"

class Client < ActiveRecord::Base
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end