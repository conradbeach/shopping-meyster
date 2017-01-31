class SessionsController < ApplicationController
  def new
    redirect_to lists_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:success] = "Glad to have you back #{user.username}!"
      redirect_to lists_path
    else
      flash[:error] = "Hmmm... Those credentials don't look valid."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "See you again soon!"
    redirect_to root_path
  end
end
