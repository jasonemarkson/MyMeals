Rails.application.routes.draw do
  #enter custom routes above the resources
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/' => 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :reviews

  resources :users do
    resources :reviews, only: [:index] #see the user's reviews -- add in the date and time for that extra touch
  end

  resources :recipes do 
    resources :reviews, only: [:new] #add a new review for a recipe you are currently viewing
  end
  #create a new review while viewing a recipe show page



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
