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
    redirect_to root_path unless current_user.user_type == expected_user_type
  end
  
  def logged_in?
    !!current_user
  end
  
  def expected_user_type
    raise NotImplementedError
  end
end
