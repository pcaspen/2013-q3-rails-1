require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  halt erb(:login)
end

post "/login" do
  @username = params[:username]	
  member = Member.where(username: params[:username]).first
  if @username == member.username
    redirect "/reservations/1" 
  else  
    redirect "/reservations/2"
  end  
end

get "/reservations/1" do
  halt erb(:reservations)
end
