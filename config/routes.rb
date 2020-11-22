Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks

  # resources :sessions
  get '/session', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  resources :users

end
