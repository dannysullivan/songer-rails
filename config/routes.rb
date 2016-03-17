Rails.application.routes.draw do
  root to: 'main#index'
  resources :songs, only: [:new, :create, :index, :show, :update]
end
