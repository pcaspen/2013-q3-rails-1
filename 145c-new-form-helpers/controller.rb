require '../dvc-sinatra.rb'

get "/" do
  @occupations = Occupation.all
  halt erb(:root)
end

post "/" do
  occupation 	= Occupation.find[:id]
  occupation	= params[:name]
  occupation.save!
  redirect "/"
end
