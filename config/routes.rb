Rails.application.routes.draw do

  root to: 'home#top'
  
  #shops
  get 'shops/new', to: 'shops#new'
  get 'shops/:id', to: 'shops#show', as: 's_show'
  get 'shops/:id/edit', to: 'shops#edit', as: 's_edit'
  post 'shops/create', to: 'shops#create'
  post 'shops/update', to: 'shops#update'
  
  #users 会員系
  get 'users/new', to: 'users#new', as: 'u_new'
  post 'users/create', to: 'users#create'
  get 'users/show', to: 'users#show', as: 'u_show'
  get 'users/edit', to: 'users#edit', as: 'u_edit'
  patch 'users/update', to: 'users#update'
  post 'users/destroy', to: 'users#destroy'
  # user_sessionsにまとめます。
  # users/createでURLが競合してしまうため、URLを変更しました。
  # ログインなどに関しては、user_sessionsなどにまとめてあげるようにしましょう。
  # get 'users/login', to: 'users#login_user', as: 'u_login'
  # post 'users/logedin', to: 'users#post_login_user'
  # delete 'users/logout', to: 'users#logout_user', as: 'u_logout'

  # user ログイン & logout
  get 'user/login', to: 'user_sessions#new', as: 'user_login'
  post 'user/logedin', to: 'user_sessions#create', as: 'user_logedin'
  delete 'user/logout', to: 'user_sessions#logout', as: 'user_logout'


end
