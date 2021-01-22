# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :items do
    resources :subitems
  end
end
