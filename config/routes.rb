Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  devise_for :users
  root 'top#index'
  resources :incomes, except: [:show]
  resources :payments, except: [:show]
end
