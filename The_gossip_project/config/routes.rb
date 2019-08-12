Rails.application.routes.draw do
 root to: 'gossip#index'

  get '/contact', to: 'user#contact'
  get '/team', to: 'user#team'
  get '/welcome/:first_name' , to: 'pages#index_logged', as: 'index_logged'
  get '/session/index', to: 'session#index'

  resources :session, only: [:create, :new, :destroy]
  resources :gossip 
  resources :user
  resources :city

end
