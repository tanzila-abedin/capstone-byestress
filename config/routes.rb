Rails.application.routes.draw do
  root "microposts#index"
  devise_for :users
  resources :users, only: [:index, :show]



  # get 'microposts/new'
  # get 'followings/new'
  # get 'users/new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #  root "application#index"
end
