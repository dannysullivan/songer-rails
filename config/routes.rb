Rails.application.routes.draw do
  root to: 'main#index'

  get '/about', to: 'main#about'
  resources :songs, only: [:new, :create, :show]
end
