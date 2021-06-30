Rails.application.routes.draw do
  root 'theater#index'
  resources :theater_admin do
    get 'screens'
    post 'create_screen'
    get 'shows'
    post 'create_show'
  end
  resources :theater do
    get 'shows'
  end

  get '/movie/:id', to: 'theater#movie', as: 'movie'
  get '/show/:id', to: 'theater#movie_show', as: 'movie_show'
  delete 'delete_screen/:id', to: 'theater_admin#delete_screen', as: 'delete_screen'
  get 'edit_screen/:id', to: 'theater_admin#edit_screen', as: 'edit_screen'
  patch 'update_screen/:id', to: 'theater_admin#update_screen', as: 'update_screen'
  delete 'delete_show/:id', to: 'theater_admin#delete_show', as: 'delete_show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
