Rails.application.routes.draw do
  resources :users
  
  root to: "tasks#index"
  resources :tasks
end