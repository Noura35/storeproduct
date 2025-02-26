Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }


  resources :categories
  resources :products
  resources :orders



  get "up" => "rails/health#show", as: :rails_health_check

  
  root "home#index"
end
