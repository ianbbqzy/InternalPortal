Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users
  resources :schedules, only: [:new, :show, :index, :create, :destroy]
  resources :teams, only: [:index, :show]
  resources :requests, only: [:new, :create, :edit, :update]
  patch 'approve', to: 'requests#approve', as: 'approve'
  patch 'done', to: 'requests#done' , as: 'done'
  get 'timeslots', to: 'users#timeslots', as: 'timeslots'
end
