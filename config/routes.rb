Rails.application.routes.draw do
  devise_for :users
  resources :picks
  resources :games
  resources :seasons
  resources :teams
  root to: "users#index"
end
