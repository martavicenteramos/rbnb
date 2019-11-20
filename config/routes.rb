Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dogs do
    resources :bookings
    resources :pictures, only: [:create, :destroy]
  end

  resources :users, only: [:show, :update, :edit]
end


