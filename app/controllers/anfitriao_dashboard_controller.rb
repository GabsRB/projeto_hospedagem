class AnfitriaoDashboardController < ApplicationController
  before_action :set_user
  helper_method :current_user
  before_action :require_login

  def index
   
  end

  def set_user
     # @user = User.find(session[:user_id])
    end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  private

  def require_login
    unless session[:user_id]
      redirect_to root_path, alert: "Você precisa estar logado para acessar esta página."
    end
  end
  end
