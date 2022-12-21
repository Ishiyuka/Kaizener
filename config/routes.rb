Rails.application.routes.draw do
  root 'homes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :teams do
    resources :assigns, only: %i[index create destroy]
    resources :issues do
      get 'search', on: :collection
      resources :plans  do
        resources :comments
      end
    end
  end

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

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
