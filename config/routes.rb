Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  resources :questions, only: [:index, :new, :create] do
    resources :answers, only: [:new, :create]
  end
end
