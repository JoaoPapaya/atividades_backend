Rails.application.routes.draw do
  resources :usuarios
  resources :enderecos

  get "up" => "rails/health#show", as: :rails_health_check

  root "inicio#index"
end
