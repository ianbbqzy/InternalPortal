Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users
  resources :teams, only: [:index, :show]
  resources :requests, only: [:new, :create, :edit, :update]

end
