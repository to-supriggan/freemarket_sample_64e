Rails.application.routes.draw do
  devise_for :users
  root to: "users#credit_card_registration"
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
  resources :products
end