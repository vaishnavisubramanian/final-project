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
  get '/delete', to: 'buses#delete'
  get '/buses/edit/:bus_id', to: 'buses#edit_bus'
  put '/buses/edit/:bus_id', to: 'buses#update_bus'
  get '/booking_faq', to: 'home#booking_faq'
  get '/payment_faq', to: 'home#payment_faq'
  get '/cancellation_faq', to: 'home#cancellation_faq'
  get '/refunds_faq', to: 'home#refunds_faq'
  get '/general_faq', to: 'home#general_faq'
  get '/account_faq', to: 'home#account_faq'
  post '/book/bus', to: 'buses#payment'
  post '/book/payment', to: 'buses#success'
  get '/buses/payment/pay', to: 'buses#pay'
  get 'pay/delete', to: 'buses#pay_delete'
end
