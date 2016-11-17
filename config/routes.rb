Rails.application.routes.draw do
  root to: 'couplets/lyrics#index'

  get '/about', to: 'main#about'
  resources :songs, only: [:new, :create, :show]

  namespace :couplets do
    resources :sources, only: [:new, :create]
    resources :lines, only: [:index]
    resources :lyrics, only: [:index]
  end
end
