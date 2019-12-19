Rails.application.routes.draw do
  devise_for :users

  root to: "addresses#index"
  resources :addresses, only: [:index, :new, :create]

  resources :products do
    collection do
      get "get_child_category"
      get "get_grandchild_category"
    end
  end

  resources :signup do
    collection do
      get 'index'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' # ここで、入力の全てが終了する
      get 'login'
    end
  end

end