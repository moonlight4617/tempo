Rails.application.routes.draw do
  root to: 'home#top'
  
  #owner_sessions
  get 'owners/login', to: 'owner_sessions#new', as: 'owner_login'
  post 'owners/loggedin', to: 'owner_sessions#create', as: 'owner_logged_in'
  delete 'owners/logout', to: 'owner_sessions#logout', as: 'owner_logout'

  #owners
  get 'owners/new', to: 'owners#new', as: 'o_new'
  get 'owners/show', to: 'owners#show', as: 'o_show'
  get 'owners/edit', to: 'owners#edit', as: 'o_edit'
  post 'owners/create', to: 'owners#create'
  post 'owners/update', to: 'owners#update'
  post 'owners/delete', to: 'owners#destory'

  #shops
  get 'shops', to: 'shops#index', as: 's_index'
  get 'shops/new', to: 'shops#new', as: 's_new'
  get 'shops/:id', to: 'shops#show', as: 's_show'
  get 'shops/:id/edit', to: 'shops#edit', as: 's_edit'
  get 'shops/:id/set_business_time', to: 'shops#set_business_time', as: 's_set_business_time'
  post 'shops/create', to: 'shops#create'
  post 'shops/zip', to: 'shops#zip'
  patch 'shops/:id/update', to: 'shops#update'
  patch 'shops/:id/create_business_time', to: 'shops#update'
  delete 'shops/:id/delete', to: 'shops#destroy', as: 's_destroy'

  #calendars
  get 'shops/calendar/index', to: 'calendars#index_for_user', as: 'c_index'
  # get 'shops/:id/calendar/demo', to: 'calendars#demo', as: 'c_demo'
  get 'shops/:id/calendar/new', to: 'calendars#new', as: 'c_new'
  get 'shops/:id/calendar/next', to: 'calendars#next', as: 'c_next'
  get 'shops/:id/calendar/prev', to: 'calendars#prev', as: 'c_prev'
  get 'shops/:id/calendar/s_index', to: 'calendars#s_index', as: 'c_s_index'
  get 'shops/:id/calendar/:id/edit', to: 'calendars#edit', as: 'c_edit'
  post 'shops/:id/calendar/create', to: 'calendars#create', as: 'c_create'
  # post 'shops/:id/calendar/demo_create', to: 'calendars#demo_c', as: 'demo_c_create'
  patch 'shops/:id/calendar/:id/update', to: 'calendars#update', as: 'c_update'
  delete 'shops/:id/calendar/:id/delete', to: 'calendars#destroy', as: 'c_destroy'

  #users
  get 'users/new', to: 'users#new', as: 'u_new'
  get 'users/show', to: 'users#show', as: 'u_show'
  get 'users/edit', to: 'users#edit', as: 'u_edit'
  post 'users/create', to: 'users#create'
  patch 'users/update', to: 'users#update'
  post 'users/destroy', to: 'users#destroy'

  #user_session
  get 'users/login', to: 'user_sessions#new', as: 'user_login'
  post 'users/loggedin', to: 'user_sessions#create', as: 'user_loggedin'
  delete 'users/logout', to: 'user_sessions#logout', as: 'user_logout'

end
