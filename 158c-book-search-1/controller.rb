require '../dvc-sinatra.rb'

get "/" do
  halt erb(:browse)
end

get "/year/:year" do
  @year = params[:year]
  @books = Book.where(publication_year: @year).all
  @header = "Books published in #{@year}"
  halt erb(:index)
end

# TODO: Write author route
get "/author/:author" do
  @author = params[:author]
  @books = Book.where(author: @author).all
  @header = "Books published by #{@author}"
  halt erb(:index)
end

# TODO: Write topic route
get "/topic/:topic" do
  topic = params[:topic]
  @books = Book.where("title ilike ?", "%#{topic}%").all 
  @header = "Books published about #{topic}"
  halt erb(:index)
end
