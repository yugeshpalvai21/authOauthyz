Rails.application.routes.draw do
  root 'pages#home'
  get 'privacy', to: 'pages#privacy_policy'
end
