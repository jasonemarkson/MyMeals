Rails.application.routes.draw do
  #enter custom routes above the resources
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/' => 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :reviews
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
