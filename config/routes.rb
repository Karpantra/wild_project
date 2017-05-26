Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :bookings, only: :create
    resources :reviews, only: :create
  end
  resources :bookings, only: [:destroy, :update, :edit]
end
