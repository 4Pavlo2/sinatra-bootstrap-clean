#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require "sqlite3"
require "rake"


set :database, { adapter: 'sqlite3', database: 'posts.db' }

class Post < ActiveRecord::Base
	has_many :comments
	validates :name, presence: true, length: { minimum: 3 }
end

class Comment < ActiveRecord::Base
	belongs_to :posts
	validates :name, presence: true, length: { minimum: 3 }
end

get '/' do
	@posts = Post.order('created_at DESC')
	erb :index
end

get '/new' do
	@c = Post.new 
	erb :new			
end

post '/new' do
	@c = Post.new params[:post]
	if @c.save
	erb "<h2>thanks </h2>"
	else
		@error = @c.errors.full_messages.first
		erb :new
	end
end
#=begin
get '/post/:id' do
	@posts = Post.find(params[:id])
	@cc = Comment.new
	@comments = Comment.order('created_at DESC')
	@comments = Comment.find(params[:id])
	erb :post
end


post '/post/:id' do
	@i = Post.new params[:id]
	@c = Post.new params[:post]
	@cc = Comment.new
	@row = @i[0]

@cc = Comment.new params[:comment]
	if @cc.save
	erb "<h2>thanks </h2>"
	else
		@error = @cc.errors.full_messages.first
		redirect to('/post/' + id)
	end
end
