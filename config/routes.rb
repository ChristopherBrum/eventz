# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :registrations
    resources :likes, only: %i[create destroy]
  end

  resource :session, only: %i[new create destroy]
  get 'signin', to: 'sessions#new'

  resources :users
  get 'signup', to: 'users#new'
end
