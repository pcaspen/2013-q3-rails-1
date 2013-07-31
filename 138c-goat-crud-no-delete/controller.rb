require '../dvc-sinatra.rb'

get "/" do
  @goats = RacingGoat.all
  halt erb(:index)
end

get "/new-goat" do
  @goat = RacingGoat.new
  halt erb(:new)
end

get "/:id" do
  @goat = RacingGoat.find(params[:id])
  halt erb(:edit)
end