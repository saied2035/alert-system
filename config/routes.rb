Rails.application.routes.draw do
  devise_for :users
  resources :alerts, only: [:index]
  namespace :api do
    resources :alerts, only: [:index, :create]
  end
  root "alerts#index"
end
