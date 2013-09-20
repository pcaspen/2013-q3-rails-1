class UsersController < ApplicationController
  before_filter do
    @logged_in_user = User.where(id: session[:logged_in_user_id]).first
  end

  def index
    @users = User.order("id")
    render :index and return
  end

  def new
    @user = User.new
    render :new and return
  end




  def create
    @user                       = User.new
    @user.email                 = params[:email]
    @user.password              = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.email_verification_token = rand(10 ** 8)
    if @user.save
      
      flash[:success] = "Please verify your email address by clicking the link in your email."

      Pony.mail(
        to:      @user.email,
        subject: "Thanks for registering",
        body:    "Please click the following link to verify your email address:
        #{verify_email_url(@user.id, @user.email_verification_token)}")

      session[:logged_in_user_id] = @user.id
      redirect_to users_path and return
    else
      render :new and return
    end
  end

  def login
    named_user = User.where(email: params[:email]).first
    if named_user && named_user.authenticate(params[:password])
      session[:logged_in_user_id] = named_user.id
    else
      flash[:error] = "Wrong email or password"
    end
    redirect_to users_path and return
  end

  def logout
    session.clear
    redirect_to users_path and return
  end

  def verify_email
    user = User.where(id: params[:user_id]).first
    if user != nil
      if user.email_verification_token == params[:token]
        user.was_email_verified = true
        user.save! 
        flash[:success] = "Email has been verified."
        redirect_to users_path and return  
      else
        flash[:error] = "Wrong email verification token."
      end  
      redirect_to users_path and return
    else
      flash[:error] = "Couldn't find user with that ID"    
    end
  end

  def resend_verification_email
    Pony.mail(
      to:      @user.email,
      subject: "Thanks for registering",
      body:    "Please click the following link to verify your email address:
      #{verify_email_url(@user.id, @user.email_verification_token)}")
    flash[:success] = "verification email sent."
    redirect_to users_path and return
  end
end
