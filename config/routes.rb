Rails.application.routes.draw do
  root 'chat_room#index'
  get 'signup', to: 'sessions#signup'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
