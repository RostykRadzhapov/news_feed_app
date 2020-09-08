# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles
  devise_for :users

  root 'articles#index'

  namespace :admin do
    resources :users
  end
end
