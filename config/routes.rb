Rails.application.routes.draw do
  # Root route (homepage)
  root "static_pages#home"

  # Static pages routes
  get "/help", to: "static_pages#help", as: "help"
  get "/about", to: "static_pages#about", as: "about"
  get "/contact", to: "static_pages#contact", as: "contact"

  # Signup, login, and logout routes
  get "/signup", to: "users#new", as: "signup"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # User resource routes
  resources :users, only: [:new, :create, :show, :edit, :update]


  # Account activation and password reset routes
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
