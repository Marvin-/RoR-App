Rails.application.routes.draw do

  get 'sessions/new'

  root                  'static_pages#home'
  get     'contact' =>     'static_pages#contact'
  get     'signup' =>   'users#new'
  get     'login' =>    'sessions#new'
  post    'login' =>    'sessions#create'
  delete  'logout' =>   'sessions#destroy'
  resources :users
  # , :only => [:new, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
