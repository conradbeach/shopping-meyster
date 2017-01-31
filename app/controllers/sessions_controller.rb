class SessionsController < ApplicationController
  def new
    redirect_to lists_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "You are now logged in."
      redirect_to lists_path
    else
      flash[:error] = "There's something wrong with your login credentials."
      redirect_to login_path
    end
  end
end
