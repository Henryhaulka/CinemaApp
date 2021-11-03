Rails.application.routes.draw do
  root  'movies#index'
  # get 'movies' => 'movies#index'
  resources :movies
  # get 'movies/:id' => 'movies#show'
end
