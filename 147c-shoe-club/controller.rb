require '../dvc-sinatra.rb'

get "/" do
  @customer = Customer.first
  halt erb(:main)
end

get "/sign_up" do
  @customer = Customer.first
  halt erb(:sign_up)
end

post "/sign_up" do
  @customer = Customer.first
  if params[:commit] == "Go back"
    redirect "/"
  elsif params[:commit] == "Continue"
    @customer.save!
    redirect "/shipping"    
  end
end

get "/shipping" do
  @customer = Customer.first
  @states = USState.all 
  halt erb(:shipping)
end

post "/shipping" do
  @customer = Customer.first
  @states = USState.all 
  if params[:commit] == "Go back"
    redirect "/sign_up"
  elsif params[:commit] == "Continue"
    @customer.save!
    redirect "/billing"
  end
end

get "/billing" do
  @customer = Customer.first
  @states = USState.all 
  halt erb(:billing)
end

post "/billing" do
  @customer = Customer.first
  @states = USState.all 
  if params[:commit] == "Go back"
    redirect "/shipping"
  elsif params[:commit] == "Continue"
    @customer.save!
    redirect "/review"
  end
end

get "/review" do
  halt erb(:review)
end

post "/review" do
  @customer = Customer.first
  @states = USState.all 
  if params[:commit] == "Go back"
    redirect "/billing"
  elsif params[:commit] == "Start over"
    @customer.destroy
    redirect "/"
  elsif params[:commit] == "Place order"  
    @customer.save!
    redirect "/thank_you"
  end
end

get "/thank_you" do
  halt erb(:thank_you)
end
