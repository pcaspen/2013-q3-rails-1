require '../dvc-sinatra.rb'

get "/" do
  @patients = Patient.all
  halt erb(:index)
end

get "/patients/:id" do
  @patient = Patient.find(params[:id])
  halt erb(:edit)
end
