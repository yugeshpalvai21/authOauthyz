Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations', omniauth_callbacks: 'users/callbacks' }
  resources :users, only: [:index, :show, :edit, :update]
  root 'pages#home'
  get 'privacy', to: 'pages#privacy_policy'
end
