Rails.application.routes.draw do
  root to: 'main#index'
  resources :songs, only: [:create, :show]
end
