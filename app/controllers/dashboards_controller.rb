class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_type

  def voluntario
  end

  def anfitriao
  end

  private

  def check_user_type
    if action_name == 'volunteer' && current_user.user_type != 'volunteer'
      redirect_to root_path, alert: "Você não tem acesso para essa pagina"
    elsif action_name == 'host' && current_user.user_type != 'host'
      redirect_to root_path, alert: "Você não tem acesso para essa pagina"
    end
  end
end
