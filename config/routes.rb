Rails.application.routes.draw do
  get 'messages/create'
  get 'conversations/create'
  devise_for :users
  root to: 'conversations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end
end
