Rails.application.routes.draw do
  get '/about',to: 'top#index'
  get '/sign_up',to: 'sign_up#index'
  get 'users/recommend',to: 'users#recommend'
  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "posts#index"
  resources :users, only: [:index,:show]
  resources :posts
  resources :relationships, only: [:create, :destroy]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:create, :index]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
