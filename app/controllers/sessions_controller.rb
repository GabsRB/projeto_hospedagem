class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Entrada com sucesso!"
    else
      flash.now[:danger] = "E-mail ou senha invalida. Tente NOvamente!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Ação de saida com sucesso!"
  end
end
