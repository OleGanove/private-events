Rails.application.routes.draw do
  resources :users, 	only: [:index, :show, :new, :create, :destroy]
  resources :sessions, 	only: [:new, :create, :destroy]
  resources :events, 	only: [:index, :new, :create, :show]

  match "/signup",  to: "users#new", 		via: :get
  match "/signin",  to: "sessions#new", 	via: :get
  match "/signout",	to: "sessions#destroy", via: :delete

  root "users#index"
end
