# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :items do
    resources :subitems
  end
end
