Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :writes do
    resources :write_comments, only:[:create, :destroy]
  end
  resources :users
end
