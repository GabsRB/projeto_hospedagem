class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  
      redirect_to choose_user_type_path(@user) 
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
    #Rails.logger.debug "\n\nparams:#{params.inspect}\n\n"
    @user = User.find(params[:id])
    #user_local = @user.update(user_params)
  
    if @user.update(user_params)
      Rails.logger.debug "User Type: #{@user.user_type}"
      session[:user_id] ||= @user.id
      case @user.user_type
      when 'voluntario'
        redirect_to voluntario_dashboard_path
      when 'anfitriao'
        redirect_to anfitriao_dashboard_path
      else
        redirect_to root_path
      end
    else
      render :choose_user_type
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

