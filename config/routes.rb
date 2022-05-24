Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "landing_page#main"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show"
  get "/dashboard/discover", to: "users#discover"
  get "/dashboard/movies/:id", to: "users#movies"
  get "/dashboard/dashboard/movies", to: "users#movies"
  get "/dashboard/movies", to: "users#movies"

  get "/dashboard/movie/:movie_id", to: "movies#show"
  get "/dashboard/movies/:movie_id/viewing-party/new", to: "movies#new"
  post "/dashboard/movies/:movie_id/viewing-party", to: "movies#create"
end
