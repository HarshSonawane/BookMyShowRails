Rails.application.routes.draw do
  root 'theater#index'
  
  resources :theater do
    get 'shows'
    resources :shows, only: [:show,]
  end

  namespace :admin do
    root 'screens#index'
    get 'bookings'
    resources :shows, :screens
  end

  authenticated do
    root to: "theater#index", as: :authenticated_root
  end

  get '/movie/:id', to: 'theater#movie', as: 'movie'
  # get '/show/:id', to: 'theater#movie_show', as: 'movie_show'
  # get '/show/details/:id', to:'theater#show_details', as: 'show_details'
  post '/booking', to:'theater#create_booking', as: 'create_booking'
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  devise_for :users
end
