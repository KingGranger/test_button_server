Rails.application.routes.draw do
  resources :images
  resources :drawings
  resources :events
  resources :event_types
  resources :arenas
  resources :authentications, only: [:index, :create]
  resources :users
end
