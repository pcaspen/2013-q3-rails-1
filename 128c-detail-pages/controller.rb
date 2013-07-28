require '../dvc-sinatra.rb'

get "/" do
  @apartments = Apartment.all
  halt erb(:index)
end

get "/apartments/:id" do
  id = params[:id]	
  @apartment = Apartment.find(id)
  halt erb(:show)
end



# require '../dvc-sinatra.rb'

# get "/" do
#   @apartments = Apartment.all
#   halt erb(:index)
# end

# get "/apartments/:id" do
#   id = params[:id]
#   @apartment = Apartment.find(id)
#   halt erb(:show)
# end


# require '../dvc-sinatra.rb'

# get "/" do
#   # TODO second: add code here to load @apartments
#   halt erb(:index)
# end

# get "/apartments/1" do
#   # TODO first: add code here to load @apartment
#   halt erb(:show1)
# end

# get "/apartments/2" do
#   # TODO first: add code here to load @apartment
#   halt erb(:show2)
# end
