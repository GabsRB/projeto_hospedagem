class DashboardController < ApplicationController
    before_action :authenticate_user! # Assumindo que você tem autenticação configurada
    before_action :check_user_type
  
    def volunteer
      # Lógica específica para o dashboard de voluntário
    end
  
    def host
      # Lógica específica para o dashboard de anfitrião
    end
  
    private
  
    def check_user_type
      if action_name == 'volunteer' && current_user.user_type != 'volunteer'
        redirect_to root_path, alert: "Acesso não autorizado."
      elsif action_name == 'host' && current_user.user_type != 'host'
        redirect_to root_path, alert: "Acesso não autorizado."
      end
    end
  end