class PageController < ApplicationController
    before_action :require_login
  
    def dashboard
      @user = current_user
      render 
    end
  
    private
  
    def require_login
      unless session[:user_id]
        redirect_to login_path, alert: "Você deve estar logado para poder entrar"
      end
    end
  end