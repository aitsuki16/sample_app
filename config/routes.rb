Rails.application.routes.draw do
  # Root route (homepage)
  root "static_pages#home"

  # Static pages routes
  get "/help", to: "static_pages#help", as: "help"
  get "/about", to: "static_pages#about", as: "about"
  get "/contact", to: "static_pages#contact", as: "contact"

  # Signup route mapped to users#new
  get "/signup", to: "users#new", as: "signup"

  # User resource routes (new, create, show)
  resources :users, only: [:new, :create, :show]
end

