Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    post :favorite, on: :member
    resources :tasks do
      patch :completed, on: :member
      patch :incomplete, on: :member
    end
  end

  get '/users/:user_id/favorites' => "users/favorites#index", as: :user_favorite_lists
  delete '/users/:user_id/favorites/:id' => "users/favorites#destroy", as: :remove_from_favorites

  get 'public_lists' => "home#public_lists"

  root "home#index"
end
