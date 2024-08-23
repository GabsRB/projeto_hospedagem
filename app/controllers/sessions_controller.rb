class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:alert] = 'Combinação de email/senha inválida'
      render :new
    end
  end

  def destroy
    session.delete(:user_id) 
    redirect_to root_path, notice: 'Você foi desconectado com sucesso.'
  end
end
