# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes
  root 'events#index'

  resources :events do
    resources :registrations
  end

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'

  resources :users
  get 'signup', to: 'users#new'
end
