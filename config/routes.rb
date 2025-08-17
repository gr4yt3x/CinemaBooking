Rails.application.routes.draw do
  get "movies/index"
  get "cinemas/index"
  get "cinemas/show"
  get "cinemas/create"
  get "cinemas/update"
  get "cinemas/destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

  # City
  resources :cities, except: [ :new, :edit ]

  # Movie
  resources :movies, except: [ :new, :edit ]

  # Cinema
  resources :cinemas, except: [ :new, :edit ]

  # Hall
  resources :halls, except: [ :new, :edit ]

  # Seat
  resources :seats, except: [ :new, :edit ]

  # Movie Session
  resources :movie_sessions, except: [ :new, :edit ]
end
