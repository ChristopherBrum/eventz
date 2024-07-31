# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :likes
    resources :registrations
  end

  resource :session, only: %i[new create destroy]
  get 'signin', to: 'sessions#new'

  resources :users
  get 'signup', to: 'users#new'
end
