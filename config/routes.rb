Rails.application.routes.draw do
  root 'theater#index'
  resources :theater do
    resources :shows
  end

  get '/movie/:id', to: 'theater#movie', as: 'movie'
  get '/show/:id', to: 'theater#movie_show', as: 'movie_show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
