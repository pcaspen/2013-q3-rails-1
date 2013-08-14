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

get "/reservations/:member_id" do
  member_id = params[:member_id]
  @member = Member.find(member_id)
  @reserved_cars = Car.where(reserving_member_id: @member.id).all
  halt erb(:reservations)
end

post "/reservations/:member_id" do
  member_id = params[:member_id]
  member = Member.find(member_id)

	if params[:commit] == "Logout"
		redirect "/"
	end

	Car.all.each do |car|
    if params[:commit] == "Reserve car #{car.id}"
      car.reserving_member_id = member_id
      car.save!
    end
  end

  Car.all.each do |car|
    if params[:commit] == "Return car #{car.id}"
      car.reserving_member_id = nil
      car.save!
    end 
  end

  
  redirect "/reservations/#{member_id}"
end