Rails.application.routes.draw do
  root 'sessions#new'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:create]
  resources :lists, except: [:new, :edit]
end
