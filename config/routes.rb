Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  # Routes for Google authentication
  get '/auth/:provider/callback' => 'sessions#create'

  resources :reviews
  resources :cigars do
    resources :reviews
  end
  resources :brands, only: [:new, :show]
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
