Rails.application.routes.draw do
  get 'users/show'

  get 'welcome/index'

  get 'welcome/about'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
