Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :users, only: [:show]
  resources :posts
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:create, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
