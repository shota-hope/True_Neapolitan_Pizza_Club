Rails.application.routes.draw do
  root 'prefectures#index'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/napolipizza/sitemaps/sitemap.xml.gz")

  resources :users
  resources :prefectures, only: %i[index show]
  resources :shops, only: %i[index show] do
    resources :posts, only: %i[new create show destroy], shallow: true
    get 'visits', on: :collection
    resource :visit, only: %i[create destroy]
  end
end
