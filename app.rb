#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def init
	@db = SQLite3::Database.new "blog.db"
	@db.results_as_hash = true # щоб у вигляді хещу дані подавалися
end

before do
init
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

configure do
init
@db.execute 'CREATE TABLE if not exists Posts
 (
	 "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "created_date" DATE,
   "content" TEXT
   )'
end

get '/forum' do
	erb :forum #"Hello World"
  end

  post '/forum' do
	@content = params[:content]

	if @content.length <= 0
		@error = 'Type text'
		return erb :forum
	end

	erb "You typed: #{@content}"
  end