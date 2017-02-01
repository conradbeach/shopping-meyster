class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to do that."
      redirect_to login_path
    end
  end

  def require_owner(model, id)
    record = model.find(id)

    unless logged_in? && (record.user == current_user)
      flash[:error] = "You don't have permission to do that."
      redirect_to login_path
    end
  end
end
