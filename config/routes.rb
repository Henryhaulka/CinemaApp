Rails.application.routes.draw do
  resources :users
  get 'signup' => 'users#new'
  root 'movies#index'
  resources :movies do
    resources :registrations
  end
  # resources handles all these below
  # get 'movies' => 'movies#index'
  # get 'movies/new' => 'movies#new'
  # get 'movies/:id' => 'movies#show', as: 'movie'
  # get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  # patch 'movies/:id' => 'movies#update'
end
