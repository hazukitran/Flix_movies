Rails.application.routes.draw do

  resources :genres

  get "signin" => "sessions#new"
  resource :session
  
  get "signup" => "users#new"
  resources :users

  # get "movies/filter/flops" => "movies#index", scope: "flops"
  # get "movies/filter/hits" => "movies#index", scope: "hits"
  get "movies/filter/:scope" => "movies#index", as: "filtered_movies"
  root "movies#index"
  resources :movies do
    resources :reviews
    resources :favourites
  end
  
end
