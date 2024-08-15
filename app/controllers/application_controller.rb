class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :authenticate_user!

  def current_user
    if session[:user_id]
       @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else 
      @current_user = nil
    end
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "Você precisa estar logado para acessar essa página."
    end
  end
  
  def logged_in?
    !!current_user
  end
end
