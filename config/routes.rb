Rails.application.routes.draw do
  resources :reservations
  resources :block_times
  resources :work_days
  resources :doctors do
    collection do
      get 'by_hospital/:hospital_id', action: :by_hospital, as: :by_hospital
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
