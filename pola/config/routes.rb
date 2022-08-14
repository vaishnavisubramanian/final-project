# frozen_string_literal: true

Rails.application.routes.draw do
  get 'buses/index'
  root 'home#index'
  get '/home', to: 'home#home', as: :home
  get '/signup', to: 'users#render_signUp'
  # get "/signin", to: "sessions#render_signIn"
  post '/create_new_user', to: 'users#create_user'
  get '/signin', to: 'sessions#new', as: :new_sessions
  post '/signin', to: 'sessions#create', as: :sessions
  delete 'signout', to: 'sessions#destroy', as: :destroy_session
  resources :buses
  get '/about', to: 'home#about'
  get '/home', to: 'home#home'
  get '/service', to: 'home#service'
  get '/bookings', to: 'home#bookings'
  get '/addbus', to: 'buses#new'
  post '/search_bus', to: 'home#search'
  get '/buses/search/list', to: 'buses#list_bus', as: :bus_list
end
