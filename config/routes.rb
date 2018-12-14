Rails.application.routes.draw do
  root 'chat_room#index'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
