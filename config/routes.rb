Rails.application.routes.draw do
  devise_for :users
  resources :picks
  resources :games
  resources :weeks
  resources :seasons
  resources :teams
  get "/home", to: "home#index"
  root to: "home#index"
end
