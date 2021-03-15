Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: :show
  resources :items, only: [:index, :create, :new, :show, :edit, :destroy, :update]
end
