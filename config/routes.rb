Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  root 'prefectures#index'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create show]
  resources :prefectures, only: %i[index show]
  resources :shops, only: %i[index show]
end
