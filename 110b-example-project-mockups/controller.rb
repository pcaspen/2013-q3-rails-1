require 'sinatra'

get "/" do
	halt erb(:"2013q1")
end

get "/2013q1" do
	halt erb(:"2013q1")
end

get "/about" do
	halt erb(:about)
end
	
get "/contact" do
	halt erb(:contact)
end

get "/past" do
	halt erb(:past)
end