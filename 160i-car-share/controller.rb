require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  @username = params[:username]
  halt erb(:login)
end

post "/login" do
  @username = params[:username]

  member = Member.find(1)
  if @username == member.username
    redirect "/reservations/1"
  else
    member = Member.find(2)
    if @username == member.username
      redirect "/reservations/2"
    else
      halt erb(:login)
    end
  end

end

get "/reservations/1" do
  halt erb(:reservations)
end
