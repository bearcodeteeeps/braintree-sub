Rails.application.routes.draw do
  root 'pages#welcome'

  resources :payment_methods, only: :new do
    get :confirmation, on: :collection
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
end
