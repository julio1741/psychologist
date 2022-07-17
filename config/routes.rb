Rails.application.routes.draw do
  resources :reservations
  resources :block_times
  resources :work_days
  resources :doctors do
    collection do
      get 'by_hospital/:hospital_id', action: :by_hospital, as: :by_hospital
      get ':id/get_working_days', action: :get_doctor_working_days, as: :get_doctor_working_days
      get ':id/get_working_hours', action: :get_doctor_working_hours, as: :get_doctor_working_hours

      get 'available_hours', action: :get_available_hours, as: :get_available_hours
    end
  end
  resources :hospitals
  resources :users

  root 'sessions#welcome'
  get '/goodbye' => 'sessions#goodbye'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Google Callback
  get '/auth/:provider/callback' => 'sessions#omniauth'
  #get '*path' => redirect('/')
end
