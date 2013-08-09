require '../dvc-sinatra.rb'

get "/" do
  halt erb(:login)
end

post "/" do
  username = params[:username]
  password = params[:password]
  user = User.where(username: username).first
  if user == nil
  	@error = "Unknown user"
    @old_username = username
    halt erb(:login)
  elsif 
  	user.password != password
  	@error = "Wrong password"
  	@old_username = username
  	halt erb(:login)
  end
  redirect "/success"	
end

get "/success" do
  halt erb(:success)
end
