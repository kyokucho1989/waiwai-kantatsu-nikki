Rails.application.routes.draw do
  root to: 'plants#index'
  devise_for :users
  resources :plants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
