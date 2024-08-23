class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to choose_user_type_path(@user) # Redireciona para a tela de escolha do tipo de usuário
    else
      render :new
    end
  end

  def user_type
    @user = User.find(session[:user_id])
  end

  def choose_user_type
    @user = User.find(params[:id])
  end

  def update_user_type
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      Rails.logger.debug "User type after update: #{@user.user_type}"
      case @user.user_type
      when 'voluntario'
        redirect_to voluntario_dashboard_path
      when 'anfitriao'
        redirect_to anfitriao_dashboard_path
      else
        redirect_to root_path, alert: "Tipo de usuário inválido."
      end
    else
      render :edit, alert: "Não foi possível atualizar o tipo de usuário."
    end
  end
  
  private

  def user_type_params
    params.require(:user).permit(:user_type)
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end
  
end

