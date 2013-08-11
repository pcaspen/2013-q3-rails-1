require '../dvc-sinatra.rb'

get "/" do
  @customer = Customer.first
  halt erb(:main)
end

get "/sign_up" do
  @customer = Customer.first
  halt erb(:sign_up)
end

### START HERE WITH SAVING DATA
post "/sign_up" do
  @customer = Customer.first
  if params[:commit] == "Go back"
    redirect "/"
  elsif params[:commit] == "Continue"
    @customer.first_name = params[:first_name]
    @customer.last_name = params[:last_name]
    if @customer.save
      redirect "/shipping"
    else
      halt erb(:sign_up)  
    end    
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
    @customer.ship_speed = params[:ship_speed]
    @customer.ship_address1 = params[:ship_address1]
    @customer.ship_city = params[:ship_city]
    @customer.ship_state = params[:ship_state]
    @customer.ship_zip_code = params[:ship_zip_code]
    if @customer.save
      redirect "/billing"
    else
      halt erb(:shipping)
    end  
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
    if params[:bill_address_same_as_ship] != nil
      @customer.bill_address_same_as_ship = true
      @customer.bill_address1 = @customer.ship_address1
      @customer.bill_city = @customer.ship_city
      @customer.bill_state = @customer.ship_state
      @customer.bill_zip_code = @customer.ship_zip_code
    else
      @customer.bill_address_same_as_ship == false
      @customer.bill_address1 = params[:bill_address1]
      @customer.bill_city = params[:bill_city]
      @customer.bill_state = params[:bill_state]
      @customer.bill_zip_code = params[:bill_zip_code]     
    end  
    if @customer.save
      redirect "/review"
    end  
  end
end

get "/review" do
  @customer = Customer.first
  @states = USState.all
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
    redirect "/thank_you"
  end
end

get "/thank_you" do
  halt erb(:thank_you)
end
