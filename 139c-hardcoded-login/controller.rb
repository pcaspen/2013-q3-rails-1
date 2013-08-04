require '../dvc-sinatra.rb'

get "/" do
  halt erb(:login)
end

post "/" do
  if params[:username] != "amy"
   	@error = "Uknown username"
   	@old_username = params[:username]
  	halt erb(:login)
  end

  if params[:password] != "123"
   	@error = "Uknown password"
   	@old_username = params[:username]
  	halt erb(:login)
  else

  	redirect "/welcome" 
  end	
end

get "/welcome" do
  halt erb(:welcome)
end