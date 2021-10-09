Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root to: 'homes#top'

  resources :writes do
    resources :write_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :users do
    resource :relationships, only:[:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/search' => 'searches#search'
end
