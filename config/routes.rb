Rails.application.routes.draw do
  devise_for :users
  resources :products do
    collection do
      get "get_child_category"
      get "get_grandchild_category"
    end
  end

  root to: "products#index"
end