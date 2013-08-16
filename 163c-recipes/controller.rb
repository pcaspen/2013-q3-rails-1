require '../dvc-sinatra.rb'

get "/" do
  @recipes = Recipe.order(:id).all
  @title = "All recipes"
  halt erb(:index)
end

get "/recipe/:name" do
  @recipe = Recipe.where(name: params[:name]).first
  halt erb(:show)
end

get "/by-author/:name" do
  # TODO: assign to @recipes the recipes for this author
  author_id = Author.where(name: params[:name]).id.first
  @recipes = Recipe.where(author_id: author_id)
  # TODO: assign to @title "Recipes by _____"
  halt erb(:index)
end
