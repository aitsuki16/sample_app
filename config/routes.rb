Rails.application.routes.draw do
  get 'sessions/new'
  # Root route (homepage)
  root "static_pages#home"

  # Static pages routes
  get "/help", to: "static_pages#help", as: "help"
  get "/about", to: "static_pages#about", as: "about"
  get "/contact", to: "static_pages#contact", as: "contact"

  # Signup route mapped to users#new
  get "/signup", to: "users#new", as: "signup"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # User resource routes (new, create, show)
  resources :users, only: [:new, :create, :show]

  resources :users

end

