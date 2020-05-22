Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }

  root 'items#index'
  resources :items do 
    collection do
      get 'show2'
    end
    
  end 
  resources :users, only: :show
  resources :addresses, only:[:new, :create, :edit, :update]
end