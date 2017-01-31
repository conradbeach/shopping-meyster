class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(_user_params)

    if @user.save
      flash[:sucess] = "Welcome! You've got a shiny new account."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def _user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
