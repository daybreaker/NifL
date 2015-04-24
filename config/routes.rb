Rails.application.routes.draw do
  devise_for :users
  resources :picks
  resources :games
  resources :weeks
  resources :seasons
  resources :teams
  root to: "seasons#show"
end
