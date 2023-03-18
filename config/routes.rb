Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "devise_overrides/sessions"
  }  
  resources :alerts, only: [:index]
  namespace :api do
    resources :alerts, only: [:index, :create]
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
  end
  root "alerts#index"
end
