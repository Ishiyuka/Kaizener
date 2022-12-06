Rails.application.routes.draw do
  resources :plans
  root 'homes#index'
  resources :teams
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # resources :issues
  resources :assigns, only: %i[index create destroy]
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  resources :users, only: :show

  resources :issues do
    collection do
      get 'search'
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
