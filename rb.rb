


class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

get '/' do
	@post = Barber.order "created_at DESC"
	erb :index			
end

before do
	@barbers = Barber.all
end

get '/visit' do
	@c = Client.new 
	erb :visit			
end

