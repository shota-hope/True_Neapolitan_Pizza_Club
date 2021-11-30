Rails.application.routes.draw do
  root "prefectures#index"
  resources :prefectures, only: %i[index show]
end
