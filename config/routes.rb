Rails.application.routes.draw do
  root 'sessions#new'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:create]
end
