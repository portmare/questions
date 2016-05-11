Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  resources :questions, only: [:index, :new, :create] do
    resources :answers, only: [:new, :create] do
      resources :comments, except: [:index, :destroy]
    end
  end
end
