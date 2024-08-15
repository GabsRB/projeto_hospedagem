class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:set_user_type]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
      session[:user_id] = @user.id
      redirect_to user_type_path, notice: "Conta criada com sucesso. Bem-vindo!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "O sua conta foi deleta"
  end

  def user_type
    @user = User.find(session[:user_id]) 
  end
  
  def create_user_type
    @user = User.find(session[:user_id])
    @user.update(user_type: params[:user_type])
    if @user.save
      redirect_to root_path, notice: 'Usuário criado com sucesso!'
    else
      render :user_type
    end
  end

  def set_user_type
    @user = current_user

    if @user.update(user_type: params[:user_type])
      if @user.user_type == 'volunteer'
        redirect_to volunteer_dashboard_path
      elsif @user.user_type == 'host'
        redirect_to host_dashboard_path
      else
        redirect_to root_path, alert: "Tipo de usuário inválido."
      end
    else
      redirect_to root_path, alert: "Não foi possível atualizar o tipo de usuário."
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end

  def user_type_params
    params.require(:user).permit(:user_type)
  end

end
