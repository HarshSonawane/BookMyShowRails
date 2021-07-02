Rails.application.routes.draw do
  root 'theater#index'
  
  resources :theater do
    get 'shows'
    resources :shows, only: [:show]
  end

  namespace :admin do
    root 'screens#index'
    resources :shows, :screens, :bookings
  end

  get '/movie/:id', to: 'theater#movie', as: 'movie'
  get '/show/:id', to: 'theater#movie_show', as: 'movie_show'
  get '/show/details/:id', to:'theater#show_details', as: 'show_details'
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  devise_for :users
end
