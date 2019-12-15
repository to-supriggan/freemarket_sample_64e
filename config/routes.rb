Rails.application.routes.draw do
  devise_for :users
  root to: "products#item_detail"
  resources :signup do
    collection do
      get 'registration'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
      get 'login'
    end
  end
  resources :products
end