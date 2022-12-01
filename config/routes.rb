Rails.application.routes.draw do
  resources :teams
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  resources :issues
  root 'issues#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only: :show

  # devise_scope :user do
    # root "users/sessions#new"
  #   get "signup", to: "users/registrations#new"
  #   get "login", to: "users/sessions#new"
  #   delete "logout", to: "users/sessions#destroy"
  # end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
