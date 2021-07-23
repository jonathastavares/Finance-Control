Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#show'
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post 'entities', to: 'entities#create'
  resources :users do
    post 'edit', to: 'users#update'
    patch 'update', to: 'users#update'
  end
end
