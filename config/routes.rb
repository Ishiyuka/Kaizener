Rails.application.routes.draw do
  resources :plans
  root 'homes#index'
  resources :teams
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # resources :issues

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only: :show
  resources :assigns, only: %i[index create destroy]

  # devise_scope :user do
    # root "users/sessions#new"
  #   get "signup", to: "users/registrations#new"
  #   get "login", to: "users/sessions#new"
  #   delete "logout", to: "users/sessions#destroy"
  # end

  resources :issues do
    collection do
      get 'search'
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
