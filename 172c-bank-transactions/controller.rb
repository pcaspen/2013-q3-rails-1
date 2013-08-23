require '../dvc-sinatra.rb'

get "/"  do
  redirect "/login"
end

get "/login"  do
  halt erb(:login)
end

post "/login" do
  found_user = User.where(username: params[:username]).first

  if found_user && params[:password] == found_user.password
    session[:user_id] = found_user.id
    redirect "/accounts"
  else
    @error = "Incorrect username or password"
    halt erb(:login)
  end
end

get "/accounts" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:accounts)
end

get "/location" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:location)
end

get "/rates" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:rates)
end

get "/logout" do
  session.clear
  redirect "/login"
end

get "/accounts/:type" do
  @user = User.where(id: session[:user_id]).first
  @account = Account.where(user_id: session[:user_id], account_type: params[:type]).first
  halt erb(:transactions)
end

post "/accounts/:type" do
  @user = User.where(id: session[:user_id]).first
  @account = Account.where(user_id: session[:user_id], account_type: params[:type]).first
  
  balance = 0.00

  @account.transactions.each do |txn|
    txn.date = params["date_#{txn.id}"]
    txn.memo = params["memo_#{txn.id}"]
    txn.amount = params["amount_#{txn.id}"]
    txn.save!
  
    balance = balance + txn.amount

    if params[:commit] = "Delete transaction #{txn.id}"
      txn.destroy
      balance = balance - txn.amount
    end  
  end  

  if params[:new_date] != ""
    new_txn = Transaction.new
    new_txn.account_id = @account.id
    new_txn.date = params[:new_date]
    new_txn.memo = params[:new_memo]
    new_txn.amount = params[:new_amount]
    new_txn.save!

    balance = balance + new_txn.amount 
  end

  @account.current_balance = balance 
  @account.save!

  redirect "/accounts/#{@account.account_type}"
end  