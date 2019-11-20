Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dogs do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
    resources :pictures, only: [:create, :destroy]
  end

  resources :users, only: [:show, :update, :edit] do
    resources :bookings,  only: [:index]
  end
end


