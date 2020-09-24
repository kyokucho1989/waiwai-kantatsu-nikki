Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :users ,path_names: { create: 'make' } do
    resources :plants do
      resources :growth_records, shallow: true
    end
  end
  
  scope 'username' do
    resources :users, only: [:create]
  end

  #レスポンスのデフォルトフォーマットをJSONに変更
  defaults format: :json do
    resources :users
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
