Rails.application.routes.draw do
  root 'welcome#index'
  get 'destinations', to: 'destinations#index'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
end