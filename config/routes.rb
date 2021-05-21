Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations'}
  root 'pages#home'
  get 'privacy', to: 'pages#privacy_policy'
end
