Rails.application.routes.draw do
  get 'home/index'

  # Define a rota raiz (minha página inicial) para minha aplicação. 
  # Sendo assim, quando acessar meu domínio princial(localhost..), ele sera direcionado para ação index do ocntroller main
  root 'main#index'
 
  # Cria uma rota que responde a ação do GET para o URL '/signup'
  # Exibe formulário de registro
  get 'signup', to: 'users#new', as: 'signup'

  # Cria uma rota que responde a ação do GET para o URL '/signup'
  # Procesa os dados preenchidos no formulário de registro e cria um novo usuario
  post 'signup', to: 'users#create'

  # Cria uma rota que responde a ação do GET para o URL '/login'
  # Exibe formulário de entrada
  get 'login', to: 'sessions#new', as: 'login'

  # Cria uma rota que responde a ação do POST para o URL '/login'
  # Procesa os dados preenchidos no formulário de entrada para validação
  post 'login', to: 'sessions#create'

  # Cria uma rota que responde a ação do DELETE para o URL '/logout'
  # Destroi a sessão atual
  delete 'logout', to: 'sessions#destroy'

  get 'user_type', to: 'users#user_type'
  patch 'set_user_type', to: 'users#set_user_type'
  get 'dashboard_volunteer', to: 'dashboards#volunteer', as: 'dashboard_volunteer'
  get 'dashboard_host', to: 'dashboards#host', as: 'dashboard_host'

  #Rota para a ação Dashboard do controlador page
  get 'dashboard', to: 'page#dashboard'
  #resources  :edit
 
  resources :users, only: [:new, :create]
end
