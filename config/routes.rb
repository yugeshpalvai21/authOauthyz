Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'privacy', to: 'pages#privacy_policy'
end
