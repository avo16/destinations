Rails.application.routes.draw do
  root 'welcome#index'
  get 'destinations', to: 'destinations#index'
  get 'vacations', to: 'vacations#index'
  get 'get_form', to: 'destinations#get_form'
  get 'get_data', to: 'destinations#get_data'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
end