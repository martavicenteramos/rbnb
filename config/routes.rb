Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dogs do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
    resources :pictures, only: [:create, :destroy]
  end

  resources :users, only: [:show, :update, :edit]

  resources :bookings,  only: [:index, :update, :edit, :destroy] do
     resources :reviews, only: [:index, :edit, :new, :create]
  end

end


