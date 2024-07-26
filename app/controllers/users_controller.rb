class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Conta criada com sucesso. Bem-vindo!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
