# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#show'
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post 'entities', to: 'entities#create'
  get 'transactions', to: 'entities#index'
  get 'transactions/new', to: 'entities#new'
  get 'transactions/delete', to: 'entities#destroy'
  get 'external_transactions', to: 'entities#external_transactions'
  get 'external_transactions/assign', to: 'entities#assign'
  post '/external_transactions/external_transactions/assign', to: 'entities#call_assign'
  post 'groups', to: 'groups#create'
  get 'groups', to: 'groups#index'
  get 'groups/new', to: 'groups#new'
  get 'group/transactions', to: 'groups#transactions'
  get 'groups/delete', to: 'groups#destroy'
  resources :users do
    post 'edit', to: 'users#update'
    patch 'update', to: 'users#update'
  end
end
