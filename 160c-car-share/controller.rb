require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  halt erb(:login)
end

post "/login" do
  @username = params[:username]
  @password = params[:password]
  @member = Member.where(username: @username).first
	if @member == nil
		@error = "Error: Unknown username"
		halt erb(:login)
	else
	  if @member.password != @password
	  	@error = "Error: Wrong password"
	  	halt erb(:login)
	  else	
	    redirect "/reservations/#{@member.id}"
	  end
	end  
  halt erb(:login)
end

get "/reservations/:id" do
	@member = Member.where(id: params[:id]).first
	@username == params[:username]
	@reserved_cars = Car.where(reserving_member_id: params[:id]).all
  halt erb(:reservations)
end

post "/reservations/:id" do
	if params[:commit] == "Logout"
		redirect "/"
	end
	@cars = Car.all 
	@member = Member.where(id: params[:id]).first
	@username == params[:username]
  halt erb(:reservations)
end