require '../dvc-sinatra.rb'

get "/" do
  @color = session[:color]
  @letter = session[:letter]
  @number = session[:number]

  halt erb(:main)
end

post "/" do
  session[:color] = params[:color]
  session[:letter] = params[:letter]
  session[:number] = params[:number]
  # TODO #2: Save each setting the user entered into the session.
  #          Try raise session.inspect to see if it got saved.

  redirect "/"
end

get "/logout" do
  session.clear
  redirect "/"
end
