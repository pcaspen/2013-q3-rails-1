require '../dvc-sinatra.rb'

get "/" do
  @patients = Patient.all
  halt erb(:root)
end

post "/new" do
  post         = Patient.new
  post.systolic  = params["systolic"]
  post.diastolic = params["diastolic"]
  post.save!
  redirect "/"
end