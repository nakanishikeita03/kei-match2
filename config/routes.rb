Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "posts#index"
  resources :users, only: [:show]
  resources :posts
  resources :relationships, only: [:create, :destroy]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:create, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
