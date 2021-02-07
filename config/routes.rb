Rails.application.routes.draw do
  #enter custom routes above the resources
  get '/signup', 'users#new'
  

  resources :reviews
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
