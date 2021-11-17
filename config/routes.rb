Rails.application.routes.draw do
  resources :categories
  resource :session, only: %i[new create destroy]
  resources :users
  get 'signup' => 'users#new'
  root 'movies#index'
  get 'movies/filter/:filter' => 'movies#index', as: :filtered_movies
  resources :movies do
    resources :comments, only: %i[create destroy]
    resources :registrations
    resources :likes, only: %i[create destroy]
  end

  # resources handles all these below
  # get 'movies' => 'movies#index'
  # get 'movies/new' => 'movies#new'
  # get 'movies/:id' => 'movies#show', as: 'movie'
  # get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  # patch 'movies/:id' => 'movies#update'
end
