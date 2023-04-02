Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :new, :create, :show]
  resources :boards, only: [:index, :new, :create, :show]
  resources :comments, only: [:create]
  root "home#index"
end
