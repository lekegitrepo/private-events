Rails.application.routes.draw do
  root 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users
end
