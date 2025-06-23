Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'chests', to: 'chests#index'
  post 'chests/open', to: 'chests#open'
  post 'chests/reset', to: 'chests#reset'
  root "chests#index"
end