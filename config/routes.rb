Rails.application.routes.draw do
  resources :usuarios
  resources :enderecos

  resources :carrinhos
  resources :categorias
  resources :produtos
  resources :carrinho_produtos

  get "up" => "rails/health#show", as: :rails_health_check

  root "inicio#index"
end
