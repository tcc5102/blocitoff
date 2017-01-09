Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      # go to user show page upon sign in
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      # login page if not signed in
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  get 'welcome/index'

  get 'welcome/about'
end
