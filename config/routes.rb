Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }

  root 'items#index'
  resources :items, only: [:index, :new, :show] 
  resources :users, only: :show
  resources :addresses, only:[:new, :create, :edit, :update]
end