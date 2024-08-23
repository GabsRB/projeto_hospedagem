class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_type_path(user_id: @user.id)
    else
      render :new
    end
  end

  def user_type
    @user = User.new
  end

  def set_user_type
    @user = User.find(params[:id])
    @user.update(user_type_params)
    if @user.save
      if @user.user_type == 'voluntario'
        redirect_to volunteers_dashboard_path
      else
        redirect_to hosts_dashboard_path
      end
    else
      render :user_type
    end
  end

  private

  def user_type_params
    params.require(:user).permit(:user_type)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_type_params
    params.require(:user).permit(:user_type)
  end

  def appropriate_dashboard_path(user)
    case user.user_type
    when 'voluntário'
      volunteers_dashboard_path
    when 'anfitrião'
      hosts_dashboard_path
    else
      root_path
    end
  end
end

