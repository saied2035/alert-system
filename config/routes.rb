Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "devise_overrides/sessions"
  }  
  resources :alerts, only: [:index]
  namespace :api do
    resources :alerts, only: [:index, :create]
    devise_scope :user do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
    end
  end
  root "alerts#index"
end
