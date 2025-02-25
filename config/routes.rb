Rails.application.routes.draw do
  
  resources :categories
  resources :products

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  get "up" => "rails/health#show", as: :rails_health_check

  
  root "home#index"
end
