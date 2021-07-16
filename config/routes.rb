Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root "microposts#index"
  devise_for :users
  resources :users 
  resources :microposts, only: [:index, :create, :new, :destroy]

  resources :likes, only: [:create, :destroy]


  resources :followings, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
