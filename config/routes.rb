Rails.application.routes.draw do
  devise_for :admins
  resources :tasks do
    resources :locations
    resources :bids
  end
  resources :charges

  get 'about/index'
  get 'search/index' => 'search#index'
  devise_for :users, controllers: { registration: 'registrations' }, controllers: { sessions: 'sessions' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    resources :tasks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
