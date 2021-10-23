

post "/visit" do # here we fetch POST request from the FORM (in index.erb)
	@name = params[:name] 
	@phone = params[:phone] 
   @datetime = params[:datetime] 
   	@barber = params[:barber] 
   	@color = params[:color] 

	#new_clients = Client.new(name:  @name, phone: @phone, datetime: @datetime, barber: @barber, color: @color)
	#new_restaurant.save
#=begin
	c = Client.new

	c.name = @name
	c.phone = @phone
	c.datetime = @datetime
	c.barber = @barber
	c.color = @color

	c.save
#=end
  erb "thanks"
	#erb :visit			
  #redirect "/" # redirect to HOME
	# redirect "/restaurants/#{new_restaurant.id}" # redirect to SHOW page of the element just created!!!
end