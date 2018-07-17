Rails.application.routes.draw do
  resources :tasks do
    resources :bids
    resources :locations
  end

  get 'about/index'
  get 'search/index' => 'search#index'
  devise_for :users, controllers: { registration: 'registrations' }, controllers: { sessions: 'sessions' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
