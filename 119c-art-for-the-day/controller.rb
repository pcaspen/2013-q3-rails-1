require '../dvc-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/art/1" do
  @art = "     /|\n    /||\n   / ||\n  /  ||\n /___||\n/____||\n"
  halt erb(:art)
end

get "/art/2" do
  @art = "^-----^\n| . . |\n|  3  |\n\\-----/\n"
  halt erb(:art)
end
