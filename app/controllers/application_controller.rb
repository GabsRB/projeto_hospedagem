class ApplicationController < ActionController::Base
  before_action :require_login, unless: :public_page?
  helper_method :current_user, :logged_in?
    
     
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end
    
  def public_page?
    public_actions = {
      'sessions' => %w[new create],
      'users' => %w[new create],
      'main' => %w[index]
    }

    public_actions[controller_name]&.include?(action_name)
  end
end
