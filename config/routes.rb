Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users, controllers: { sessions: "users/sessions", omniauth_callbacks: 'omniauth_callbacks' }
  resources :picks
  resources :games
  resources :weeks
  resources :seasons
  resources :teams
  resources :picksets do
    get 'permalink', on: :member
  end
  # root to: "seasons#show"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
end
