Rails.application.routes.draw do
  resources :screens
  resources :shows
  root 'theater#index'
  resources :theater_admin do
    get 'screens'
    get 'shows'
  end
  resources :theater do
    get 'shows'
  end

  namespace :admin do
    resources :shows, :screens, :bookings
  end

  get '/movie/:id', to: 'theater#movie', as: 'movie'
  get '/show/:id', to: 'theater#movie_show', as: 'movie_show'
  get '/show/details/:id', to:'theater#show_details', as: 'show_details'
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  devise_for :users
end
