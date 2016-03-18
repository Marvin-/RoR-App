Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'signup' => 'users#new'
  resources :users
  # , :only => [:new, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
