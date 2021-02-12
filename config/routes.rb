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
  
  # chats
  get 'shops/:id/chats/new', to: 'chats#new', as: 'ch_new' 
  get 'shops/:id/chats/', to: 'chats#show', as: 'ch_show' 
  post 'shops/:id/chats/msg', to: 'chats#message', as: 'ch_msg' 
  delete 'shops/:id/chats/:id/delete', to: 'chats#destroy', as: 'ch_d' 
  
  # messages
  # get 'shops/:id/messages/index', to: 'messages#index', as: 'm_index' 
  # get 'shops/:id/messages/new', to: 'messages#new', as: 'm_new' 
  # get 'shops/:id/messages/:id', to: 'messages#show', as: 'm_show' 
  # post 'shops/:id/messages/new', to: 'messages#create', as: 'm_create' 
  # delete 'shops/:id/messages/:id/delete', to: 'messages#destroy', as: 'm_destroy' 

  #calendars
  get 'shops/calendars/index', to: 'calendars#index_for_user', as: 'c_index'
  get 'shops/:id/calendars/new', to: 'calendars#new', as: 'c_new'
  get 'shops/:id/calendars/next', to: 'calendars#next', as: 'c_next'
  get 'shops/:id/calendars/prev', to: 'calendars#prev', as: 'c_prev'
  get 'shops/:id/calendars/s_index', to: 'calendars#s_index', as: 'c_s_index'
  get 'shops/:id/calendars/:id/edit', to: 'calendars#edit', as: 'c_edit'
  post 'shops/:id/calendars/new', to: 'calendars#create', as: 'c_create'
  patch 'shops/:id/calendars/:id/update', to: 'calendars#update', as: 'c_update'
  delete 'shops/:id/calendars/:id/delete', to: 'calendars#destroy', as: 'c_destroy'

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
