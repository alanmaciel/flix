Rails.application.routes.draw do
  root :to => 'movies#index'
  get 'movies' => 'movies#index'
  get 'movies/:id' => 'movies#show', as: 'movie'
  get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'
  patch 'movies/:id' => 'movies#update'
end
