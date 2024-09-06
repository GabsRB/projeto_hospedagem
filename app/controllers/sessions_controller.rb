class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.user_type == "voluntario"
        redirect_to voluntario_dashboard_path
      elsif user.user_type == "anfitriao"
        redirect_to anfitriao_dashboard_path
      else
        redirect_to signup_path 
      end
    else
      flash.now[:alert] = 'E-mail e/ou senha são invalidos'
      render :new
    end   
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Você foi desconectado com sucesso!!'
  end
end
