Rails.application.routes.draw do
  root to: 'main#index'
  resources :manual_songs, only: [:new, :create, :index, :show, :update]
  resources :songs, only: [:create, :show]
end
