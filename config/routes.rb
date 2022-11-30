Rails.application.routes.draw do
  root to: "issues#index"
  resources :issues
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
