Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  resources :chat, only: [:index, :create]
  resources :sessions, only: [:new, :create]
  get 'hello_world',   to: 'hello_world#hello_world'
end
