Rails.application.routes.draw do
  devise_for :users
  root to: "products#item_detail"
  resources :signup do
    collection do
      get "index", to: "signup#index"
      get "step1", to: "signup#step1"
      get "step2", to: "signup#step2"
      get "step3", to: "signup#step3"
      get "step4", to: "signup#step4"
      get "step5", to: "signup#step5"
      get "login", to: "signup#login"
    end
  end
  # resources :products
end