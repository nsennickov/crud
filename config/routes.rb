# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: FastGettext.locale do
    devise_for :users
    root 'items#index'

    resources :items do
      resources :subitems
    end
  end
end
