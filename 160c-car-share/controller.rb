require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  halt erb(:login)
end

post "/login" do
  username = params[:username]
  password = params[:password]
  
  @member = Member.where(username: username).first
  if @member == nil
    @error = "Unknown username"
    halt erb(:login)
  end

  @member = Member.where(password: password).first
  if @member == nil
    @error = "Wrong password"
    @username = username
    halt erb(:login)
  end
  
  redirect "/reservations/#{@member.id}"
end

get "/reservations/:member_id" do
  member_id = params[:member_id]
  @member = Member.where(id: member_id).first
  @reserved_cars = Car.where(reserving_member_id: member_id).all
  halt erb(:reservations)
end 

post "/reservations/:member_id" do
  member_id = params[:member_id]
  @member = Member.where(id: member_id).first

  if params[:commit] == "Logout"
    redirect "/"
  end  
  
  Car.all.each do |car|
    if params[:commit] == "Return car #{car.id}"
      car.reserving_member_id = nil
      car.save!
      redirect "/reservations/#{member_id}"
    end
  end  

  Car.all.each do |car|
    if params[:commit] == "Reserve car #{car.id}"
      car.reserving_member_id = @member.id
      car.save!
      redirect "/reservations/#{member_id}"
    end 
  end
end 