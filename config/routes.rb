Rails.application.routes.draw do
  devise_for :users
  resources :products
  root to: "products#item_detail"
end