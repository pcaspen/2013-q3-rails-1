require 'sinatra'

get "/2013Q1" do
	halt erb(:2013Q1)
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