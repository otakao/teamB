Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }

  root 'items#index'
  resources :items 
  resources :users, only: :show
  resources :addresses, only:[:new, :create, :edit, :update]
  
end