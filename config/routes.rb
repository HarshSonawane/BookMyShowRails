Rails.application.routes.draw do
  root 'theater#index'
  resources :theater_admin do
    get 'screens'
    get 'edit_screen'
    get 'shows'
  end
  resources :theater do
    get 'shows'
  end

  get '/movie/:id', to: 'theater#movie', as: 'movie'
  get '/show/:id', to: 'theater#movie_show', as: 'movie_show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
