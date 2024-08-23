class UserTypesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @user.update(user_type_params)
    
    if @user.user_type == 'voluntario'
      redirect_to volunteer_dashboard_path
    elsif @user.user_type == 'anfitriao'
      redirect_to host_dashboard_path
    else
      redirect_to root_path, alert: 'Tipo de usuário inválido'
    end
  end
  
  private

  def user_type_params
    params.require(:user).permit(:user_type)
  end
end
