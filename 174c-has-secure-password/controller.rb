require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/users/new" do
  @user = User.new
  halt erb(:new)
end

post "/users/new" do
  # TODO: Create new User with the specified username and password,
  #   complaining if the username is missing or passwords don't match
  @user = User.new
  @user.username = params[:username]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]

  if @user.save == true
    redirect "/login"
  else
    halt erb(:new)
  end
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  # TODO: set user_id in session and redirect to /welcome if correct login,
  #   otherwise complain "Unknown username" or "Wrong password"

  # I'm getting a ArgumentError on this next line, no matter what I do.
  named_user = User.where(username: params[:username]).first

  if named_user == nil
    # username does not exist
    @message = "Unknown username"
    halt erb(:login)
  elsif named_user.authenticate(params[:password]) == false
    #password is incorrect
    @message = "Wrong password"
    halt erb(:login)
  else   
    #password is correct
    session[:user_id] = named_user.id
    redirect "/welcome"
  end
  halt erb(:login)
end

get "/welcome" do
  @user = User.find(session[:user_id])
  halt erb(:welcome)
end

get "/logout" do
  session.clear
  redirect "/login"
end
