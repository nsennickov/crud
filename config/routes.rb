# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    root 'items#index'

    resources :items do
      resources :subitems
    end
  end
end
