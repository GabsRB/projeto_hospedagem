Rails.application.routes.draw do
  get 'accommodations/new'
  get 'accommodations/create'
  get 'anfitriao_dashboard/index'
  get 'voluntario_dashboard/index'
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
  post '/users', to: 'users#create'

  # Cria uma rota que responde a ação do GET para o URL '/login'
  # Exibe formulário de entrada
  get 'login', to: 'sessions#new', as: 'login'

  # Cria uma rota que responde a ação do POST para o URL '/login'
  # Procesa os dados preenchidos no formulário de entrada para validação
  post 'login', to: 'sessions#create'

  # Cria uma rota que responde a ação do DELETE para o URL '/logout'
  # Destroi a sessão atual
  #delete '/logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  get 'choose_user_type/:id', to: 'users#choose_user_type', as: 'choose_user_type'
  patch '/update_user_type/:id', to: 'users#update_user_type', as: 'update_user_type'

  get 'voluntario_dashboard', to: 'voluntario_dashboard#index', as: 'voluntario_dashboard'
  get 'anfitriao_dashboard', to: 'anfitriao_dashboard#index', as: 'anfitriao_dashboard'

  get 'anfitriao_dashboard/adicionar_acomodacao', to: 'accommodations#new', as: 'new_accommodation'

  get 'accommodations', to: 'accommodations#index', as: 'accommodations'
  get '/accommodations/:id', to: 'accommodations#show'

  resources :accommodations, only: [:new, :create, :edit, :update, :index, :show]

  resources :users, only: [:new, :create]

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  
end
