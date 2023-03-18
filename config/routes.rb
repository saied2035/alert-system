Rails.application.routes.draw do
  resources :alerts, only: [:index]

  root "alerts#index"
end
