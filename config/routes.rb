Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations'}
  resources :users, only: [:index, :show]
  root 'pages#home'
  get 'privacy', to: 'pages#privacy_policy'
end
