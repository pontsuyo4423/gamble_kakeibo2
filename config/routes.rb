Rails.application.routes.draw do
  get 'limits/new'
  get 'payments/index'
  get 'payments/new'
  get 'lifetime_balance', to: 'incomes#lifetime_balance'
  devise_for :users
  root 'top#index'
  resources :incomes
  resources :payments, except: [:show]
  resources :limits
end
