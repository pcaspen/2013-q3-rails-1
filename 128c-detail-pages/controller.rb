require '../dvc-sinatra.rb'

get "/" do
  # TODO second: add code here to load @apartments
  halt erb(:index)
end

get "/apartments/:id" do
  id = params[:id]	
  @apartment = Apartment.find(id)
  halt erb(:show)
end

# get "/apartments/2" do
#   @apartment = Apartment.find(2)
#   halt erb(:show)
# end
