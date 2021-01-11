Rails.application.routes.draw do
  root 'items#index'
  
  # get "item/new"
  # post 'item/new'
  # post 'item/:id' => 'item#edit'
  # post 'item/:id/edit' => 'item#update'
  # post 'item/destroy/:id' => 'item#destroy'
  
  resources :items
end
