class SessionsController < ApplicationController
  def home
  end
  
  def new
  end

  def create
    return redirect_to(controller: 'sessions', action: 'new') if !params[:username] || params[:username].empty?
    session[:username] = params[:username]
    redirect_to controller: 'sessions', action: 'home'
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
