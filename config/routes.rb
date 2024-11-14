Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  
  root "static_pages#home"

  # Static pages routes
  get "/help", to: "static_pages#help", as: "help"
  get "/about", to: "static_pages#about", as: "about"
  get "/contact", to: "static_pages#contact", as: "contact"

  # Signup, login, and logout routes
  get "/signup", to: "users#new", as: "signup"
  get "/login",   to: "sessions#new"
  post "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  # User resource routes including the index action
  resources :users, only: [:index, :new, :create, :show, :edit, :update]

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end