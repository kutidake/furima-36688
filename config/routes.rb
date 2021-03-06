Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: 'items#index'

  resources :items do
   resources :orders, only:[:create,:index]
  end
end