require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  named_person = Person.where(name: params[:name]).first
  if named_person.authenticate(params[:password]) != false
  	session[:person_id] = named_person.id 
    redirect "/followers"
  else  
    halt erb(:login)
  end
end

get "/followers" do
  # TODO: write this
  @person = Person.find(session[:person_id])
  halt erb(:followers)
end

post "/followers" do
  # TODO: write this
  @person = Person.find(session[:person_id])
  if params[:commit] == "Follow"
  	following_new = Following.new 
  	following_new.from_person_id = @person.id 

  	followed_person = Person.where(name: params[:name]).first
  	following_new.to_person_id = followed_person.id
  	following_new.save!
  end	
  redirect "/followers"
end

get "/logout" do
  session.clear
  redirect "/"
end
