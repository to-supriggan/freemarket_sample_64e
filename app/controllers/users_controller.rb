class UsersController < ApplicationController
  def new
    @user = User.new(user_params)
  end

  def create
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