#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require "sqlite3"
require "rake"


set :database, { adapter: 'sqlite3', database: 'barbers.db' }
#set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
#set :database, "sqlite:barbers.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
	validates :phone, presence: true 
	validates :datetime, presence: true 
	validates :color, presence: true 	
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end


get '/' do
	#@barbers = Barber.all
	@barbers = Barber.order "created_at DESC"
	erb :index			
end

get '/visit' do
	@c = Client.new 
	erb :visit			
end

post "/visit" do # here we fetch POST request from the FORM (in index.erb)
	
	@c = Client.new params[:client]
	if @c.save
erb "<h2>thanks </h2>"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
	
end

get "/barber/:id" do
@barber = Barber.find(params[:id])
erb :barber
end

get '/bookings' do
	@clients = Client.order('created_at DESC')
	erb :bookings
end

get '/client/:id' do
	@client = Client.find(params[:id])
	erb :client
end



get "/monstas" do
@name = params["name"]
@names = read_names
erb :monstas
end

post "/monstas" do
	@name = params["name"]
	store_name("names.txt", @name)
	"Ok!"
end



get '/contacts' do
	"Hello World"
end