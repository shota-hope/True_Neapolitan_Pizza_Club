Rails.application.routes.draw do
  get 'shops/index'
  get 'shops/show'
  root "prefectures#index"
  resources :prefectures, only: %i[index show]
  resources :shops, only: %i[index show]
end
