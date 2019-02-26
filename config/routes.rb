Rails.application.routes.draw do
  resources :railway_stations
  get 'thought', to: 'thought#index'
  root 'chat_room#index'
  get 'signup', to: 'sessions#signup'
  post 'register', to: 'sessions#register'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#authenticate'
  delete 'logout', to: 'sessions#destroy'

  resources :trains

  post 'message', to: 'messages#create'

  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
