Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"


  resources :products do
    collection do
      get "get_child_category"
      get "get_grandchild_category"
    end
  end

  resources :signup do
    collection do
      # get 'index'
      get 'login'
      get 'step1'
      get 'step2'
      # get 'step3'
      # get 'step4'
      get 'step5' # ここで、入力の全てが終了する
      # get 'done' 
    end
  end
end