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
      get 'login'
      get 'step1'
      get 'step2'
      # get 'step3' # ページが出来次第使用予定
      # get 'step4'# ページが出来次第使用予定
      get 'step5' # ここで、入力の全てが終了する
    end
  end
end