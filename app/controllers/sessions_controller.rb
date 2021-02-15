class SessionsController < ApplicationController
  def home
  end
  
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect login information, please try again"
      redirect_to '/login'
    end
  end

  def google
    #OAuth signins
    binding.pry
    @user = User.find_or_create_by(email: auth["info"]["email"] ) do |user|
      user.name = auth["info"]["first_name"]
      user.password = SecureRandom.hex(12) #assigning them a random password for the session -- security reasons, GOogle never gives out the user's password
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
