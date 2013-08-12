require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  halt erb(:login)
end

post "/login" do
  @username = params[:username]
  Member.all.each do |member|
	  if @username == member.username
	    redirect "/reservations/#{member.id}"
	  end  
  end
  halt erb(:login)
end

get "/reservations/:id" do
	@member = Member.where(id: params[:id]).first
	@username == params[:username]
  halt erb(:reservations)
end

post "/reservations/:id" do
	if params[:commit] == "Logout"
		redirect "/"
	end	
	@member = Member.where(id: params[:id]).first
	@username == params[:username]
  halt erb(:reservations)
end