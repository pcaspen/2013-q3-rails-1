require '../dvc-sinatra.rb'

get "/" do
  
  halt erb(:login)
end

post "/" do
  if params[:username] != "amy"
    @error = "Unknown username"
    halt erb(:login)
  elsif params[:password] != "123"
  	@old_username = "amy"
  	@error = "Incorrect password"
  	halt erb(:login)
  else	
    redirect "/welcome"
  end  
end

get "/welcome" do
  halt erb(:welcome)
end
