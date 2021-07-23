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

	@results = @db.execute 'select * from Posts order by id desc'
erb :index
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
	
	@db.execute 'insert into Posts (content, created_date) values (?, datetime());', [@content]

	redirect to '/'
	#erb "You typed: #{@content}"
  end

  get '/details/:post_id' do
	#get url
	post_id = params[:post_id]
#get list\\only one post
	
results = @db.execute 'select * from Posts where id = ?', [post_id]
#choise this post
	@row = results[0]
#show details erb
	erb :details#"Displaying info for post with id #{post_id}"
  end