class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:set_user_type]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_type_path, notice: "Conta criada com sucesso. Escolha seu tipo de usuário."
    else
      render :new
    end
  end

  def user_type
    @user = User.find(session[:user_id]) 
  end

  def set_user_type
    @user = User.find(session[:user_id])

    if @user.update(user_type: params[:user_type])
      if @user.user_type == 'volunteer'
        redirect_to dashboard_volunteer_path
      elsif @user.user_type == 'host'
        redirect_to dashboard_host_path
      else
        redirect_to root_path, alert: "Tipo de usuário inválido."
      end
    else
      redirect_to root_path, alert: "Não foi possível atualizar o tipo de usuário."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
