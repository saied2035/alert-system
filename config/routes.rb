Rails.application.routes.draw do
  resources :alerts, only: [:index]
  namespace :api do
    resources :alerts, only: [:index, :create]
  end
  root "alerts#index"
end
