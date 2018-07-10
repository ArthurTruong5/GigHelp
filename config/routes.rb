Rails.application.routes.draw do
  resources :bids
  resources :tasks
  get 'about/index'
  devise_for :users, controllers: { registration: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
