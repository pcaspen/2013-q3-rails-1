require '../dvc-sinatra.rb'

get "/" do
  halt erb(:login)
end

post "/" do
  @username = User.where(username: params[:username]).first
  if @username == nil
  	@error = "Unknown username"
    halt erb(:login)	
  elsif @username != nil
    @old_username = params[:username]
    @password = User.where(password: params[:password]).first
    if @password == nil
      @error = "Wrong password"
      halt erb(:login)
    elsif @password != nil
   	  redirect "/success"
   	end  
  end
end

get "/success" do
  halt erb(:success)
end
