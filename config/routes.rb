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
      get ':id/get_working_days', action: :get_doctor_working_days, as: :get_doctor_working_days
      get ':id/get_working_hours', action: :get_doctor_working_hours, as: :get_doctor_working_hours
      get 'available_hours', action: :get_available_hours, as: :get_available_hours
    end
  end

  resources :users, only: [:new, :create, :edit, :update]

  get '/signup' => 'users#new'
  root 'sessions#welcome'
  get '/goodbye' => 'sessions#goodbye'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Google Callback
  get '/auth/:provider/callback' => 'sessions#omniauth'
end
