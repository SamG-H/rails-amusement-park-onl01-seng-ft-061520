Rails.application.routes.draw do
  resources :attractions
  resources :users
  resources :rides
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/session/', to: 'sessions#destroy'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
