Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"

  resources :products do
    collection do
      get "get_child_category"
      get "get_grandchild_category"
      get "purchase_confirmation"
      get "done"
    end
    member do
      post 'pay'
    end
  end


  resources :signup do
    collection do
      get 'login'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
    end
  end
  resources :goods, only: [:create,:index]
  resources :users do
    resources :mypages do
      collection do
        get "credit_card_registration"
        get "identification"
        get "user_logout"
        get "profile_edit"
      end
    end
  end
  resources :addresses, only: [:index, :new, :create]
  resources :cards, only: [:new, :create]
  resources :images, only: [:destroy]
end
