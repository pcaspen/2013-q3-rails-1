require '../dvc-sinatra.rb'

get "/" do
  @books = Book.all
  @topics = ['JavaScript', 'jQuery', 'Ruby', 'CSS']

  # TODO: Change the following line so @authors is filled out with whatever
  # authors are in the books table, not what's supplied below.

  # WHY DOESN'T THIS WORK?
  # @authors = []
  # Books.all.each do |author|
  #   @authors << books.author 
  # end
  # @authors = @authors.sort.uniq  

  @authors = []
  @books.each do |book|
    @authors << book.author
  end
  @authors = @authors.sort.uniq

  # TODO: Change the following line so @year is filled out with whatever
  # years are in the books table, not what's supplied below.
  @years = []
  @books.each do |book|
    @years << book.publication_year
  end
  @years = @years.sort.uniq

  halt erb(:search)
end

post "/" do
  author = params[:author]
  topic = params[:topic]
  year = params[:year]
  if params[:author] != ""
    redirect "/author/#{URI.escape(author)}"
  elsif params[:topic] != ""
    redirect "topic/#{topic}"
  elsif params[:year] != ""
    redirect "year/#{year}"   
  end  
end

get "/year/:year" do
  year = params[:year]
  @books = Book.where(publication_year: year).order(:id).all
  @header = "Books published in #{year}"
  halt erb(:index)
end

get "/author/:author" do
  author = params[:author]
  @books = Book.where("author ilike ?", "%#{author}%").order(:id).all
  @header = "Books by #{author}"
  halt erb(:index)
end

get "/topic/:topic" do
  topic = params[:topic]
  @books = Book.where("title ilike ?", "%#{topic}%").order(:id).all
  @header = "Books about #{topic}"
  halt erb(:index)
end

# TODO: Write a GET handler for routes like /isbn/0596517742.  It will
# use the show.erb page, which has been supplied to you.
get "/isbn/:isbn" do
  @book = Book.where(isbn: params[:isbn]).first
  halt erb(:show)
end
