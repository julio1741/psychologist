Rails.application.routes.draw do
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
