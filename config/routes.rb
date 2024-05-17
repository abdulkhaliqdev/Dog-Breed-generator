Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # client Path
  get '/breed', to: 'home#breed', as: 'breed'
  post '/breed_fetch', to: 'home#fetch_breed', as: 'breed_fetch'

  # Defines the root path route ("/")
  root 'home#index'
end
