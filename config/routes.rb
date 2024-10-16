Rails.application.routes.draw do
  # Group routes related to static pages
  get 'home', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about',to: 'static_pages#about'

  # Define root route
  root 'static_pages#home'
end
