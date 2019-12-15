Rails.application.routes.draw do
  devise_for :users
  root to: "products#item_detail"
  resources :signup do
    collection do
      get "signup/index", to: "signup#index"
      get "signup/step1", to: "signup#step1"
      get "signup/step2", to: "signup#step2"
      get "signup/step3", to: "signup#step3"
      get "signup/step4", to: "signup#step4"
      get "signup/step5", to: "signup#step5"
      get "signup/login", to: "signup#login"
    end
  end
  # resources :products
end