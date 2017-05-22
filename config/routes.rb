Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  devise_for :users
end
