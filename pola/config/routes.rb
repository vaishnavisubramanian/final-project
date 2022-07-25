Rails.application.routes.draw do

  root "home#index"
  get "/home", to: "home#home", as: :home
  get "/signup", to: "users#render_signUp"
  # get "/signin", to: "sessions#render_signIn"


  match "/create_new_user", :to => "users#create_user", :via => :post

get "/signin", to: "sessions#new", as: :new_sessions
post "/signin", to: "sessions#create", as: :sessions
end
