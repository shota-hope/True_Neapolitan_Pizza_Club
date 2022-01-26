Rails.application.routes.draw do
  root 'prefectures#index'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  resources :prefectures, only: %i[index show]
  resources :shops, only: %i[index show]
end
