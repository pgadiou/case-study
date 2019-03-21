Rails.application.routes.draw do
  devise_for :users
  devise_for :service_provider
  root to: 'pages#home'
  resources :service_requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
