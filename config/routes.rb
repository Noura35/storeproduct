Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }


 # resources :categories, only: [:show]
  #resources :products

  resources :categories 
  resources :products do
    get :subcategories, on: :collection
  end  
  



  resources :shopping_cart_items, only: [:create, :update, :destroy]
  resource :shopping_cart, only: [:show]
  

  resources :orders, only: [:new, :create, :show]


  post 'shopping_cart_items/:id/remove', to: 'shopping_cart_items#remove', as: 'remove_shopping_cart_item'


  get "up" => "rails/health#show", as: :rails_health_check

  
  root "home#index"
end
