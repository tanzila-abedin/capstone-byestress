# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'microposts#index'
  devise_for :users
  resources :users
  resources :microposts, only: %i[index create new destroy]

  resources :likes, only: %i[create destroy]

  resources :followings, only: %i[create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
