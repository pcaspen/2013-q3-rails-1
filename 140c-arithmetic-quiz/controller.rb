require '../dvc-sinatra.rb'

get "/" do
  redirect "/1"
end

get "/1" do
  halt erb(:question1)
end

post "/1" do
  if params[:answer] == "c"
  	redirect "/2"
  else
    redirect "/1"
  end  	
end

get "/2" do
  halt erb(:question2)
end

post "/2" do
  if params[:answer] == "a"
  	redirect "/done"
  else
    redirect "/2"
  end  	
end

get "/done" do
  halt erb(:done)
end