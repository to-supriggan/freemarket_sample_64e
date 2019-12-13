class SignupController < ApplicationController
 # 各アクションごとに新規インスタンスを作成します
 # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
  def registration
  end

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    @user = User.new # 新規インスタンス作成
  end

  def step3
    @user = User.new # 新規インスタンス作成
  end

  def step4
    @user = User.new # 新規インスタンス作成
  end

  def step5
    @user = User.new # 新規インスタンス作成
  end

  def done
  end

  private
  # 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :nick_name,
      :email,
      :password, 
      :password_confirmation, 
      :name,
      :kana_name,
      :birthday,
      :payment_method
  )
  end
end