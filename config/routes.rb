Rails.application.routes.draw do
  #get 'users/new'
  #get 'users/create'
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  
  #Rota para a ação index do controlador Main
  root "main#index"
  #Rota para a ação Index do controlador Principal
  get "principal/index", to: "principal#index"
  #Rota para o controlador principal
  resources :principal

  #Ira exibir o formulario de cadastro
  get 'signup', to: 'users#new'
  #Analisa o formulario de cadastro preenchido
  post 'signup', to: 'users#create'

  #Exibe formulario de login
  get 'login', to: 'sessions#new'
  #Analisa o formulario de login preenchido
  post 'login', to: 'sessions#create'
  #Processa a ação logout
  delete 'logout', to: 'sessions#destroy'

  #Rota para o controlador users
  resources :users

  #Rota para a ação Dashboard do controlador page
  get 'dashboard', to: 'page#dashboard'
end
