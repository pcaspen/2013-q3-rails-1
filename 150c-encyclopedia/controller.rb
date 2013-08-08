require '../dvc-sinatra.rb'

get "/" do
  @entries = EncyclopediaEntry.all
  halt erb(:index)
end

get "/:word" do
  word = params[:word]
  @entry = EncyclopediaEntry.where(word: params[:word]).first
  halt erb(:show)
end
