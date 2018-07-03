Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'sessions#new'
  resources :tasks
  resources :users, only:[:new, :create]
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only:[:new, :create, :destroy]
end
