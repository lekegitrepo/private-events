Rails.application.routes.draw do
  root 'events#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  get '/all_events', to: 'events#index'
  resources :users
  resources :events
end
