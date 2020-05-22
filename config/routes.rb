Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }

  root 'items#index'
  resources :items do 
    collection do
      get 'show2'
    end
    
  end 
  resources :users, only: :show
end

 