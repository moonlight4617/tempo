Rails.application.routes.draw do

  #shops
  get 'shops/new', to: 'shops#new'
  get 'shops/:id', to: 'shops#show', as: 's_show'
  get 'shops/:id/edit', to: 'shops#edit', as: 's_edit'
  post 'shops/create', to: 'shops#create'
  post 'shops/update', to: 'shops#update'

  #users
  get 'users/new', to: 'users#new', as: 'u_new'
  get 'users/show', to: 'users#show', as: 'u_show'
  get 'users/edit', to: 'users#edit', as: 'u_edit'
  get 'users/login', to: 'users#login_user', as: 'u_login'
  post 'users/create', to: 'users#create'
  patch 'users/update', to: 'users#update'
  post 'users/destroy', to: 'users#destroy'
  post 'users/logout', to: 'users#logout_user', as: 'u_logout'


end
