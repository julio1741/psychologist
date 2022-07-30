# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :reservations do
    member do
      get :cancel, action: :cancel
    end
  end

  resources :doctors, only: [:show] do
    collection do
      get 'by_hospital/:hospital_id', action: :by_hospital, as: :by_hospital
      get 'available_hours', action: :available_hours, as: :available_hours
    end
  end

  resources :users, only: %i[new create edit update]

  get '/signup' => 'users#new'
  root 'sessions#welcome'
  get '/goodbye' => 'sessions#goodbye'

  get 'user/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Google Callback
  get '/auth/:provider/callback' => 'sessions#omniauth'
end
