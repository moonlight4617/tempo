Rails.application.routes.draw do

  #shops
  get 'shops/new', to: 'shops#new'
  get 'shops/:id', to: 'shops#show', as: 's_show_path'
  get 'shops/:id/edit'
  post 'shops/create', to: 'shops#create'

  #users
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  post 'users/create', to: 'users#create'
  post 'users/update', to: 'users#update'
  post 'users/destroy', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
