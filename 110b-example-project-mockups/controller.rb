require 'sinatra'

get "/" do
	halt erb(:/)
end

get "/q12013" do
	halt erb(:q12013)
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