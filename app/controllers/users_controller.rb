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
      :last_name, 
      :first_name,
      :last_name_kana, 
      :first_name_kana,
      :kana_name,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number,
  )
  end
end
      # :password_confirmation,