class SignupController < ApplicationController
 # 各アクションごとに新規インスタンスを作成します
 # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # # step1で入力された値をsessionに保存
    # session[:nick_name] = user_params[:nick_name]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    # @user = User.new # 新規インスタンス作成
  end

  def step3
    # # step2で入力された値をsessionに保存
    # session[:name] = user_params[:name]
    # session[:kana_name] = user_params[:kana_name]
    # @user = User.new # 新規インスタンス作成
  end

  def step4
    # # step3で入力された値をsessionに保存
    # session[:birthday] = user_params[:birthday]
    # @user = User.new # 新規インスタンス作成
  end

  def step5
    # # step4で入力された値をsessionに保存
    # session[:payment_method] = user_params[:payment_method]
    # # binding.pry
    # @user = User.new # 新規インスタンス作成
  end

  # def create
  #   @user = User.new(
  #     nick_name: session[:nick_name], # sessionに保存された値をインスタンスに渡す
  #     email: session[:email],
  #     password: session[:password],
  #     password_confirmation: session[:password_confirmation],
  #     name: session[:name], 
  #     kana_name: session[:kana_name], 
  #     birthday: session[:birthday], 
  #     payment_method: session[:payment_method], 
  #   )
  #   # binding.pry
  #   if @user.save
  #     # ログインするための情報を保管
  #     session[:id] = @user.id
  #     redirect_to done_signup_index_path
  #   else
  #     render '/signup/step1' #変更 /signup/registration
  #   end
  # end

  # def done
  #   sign_in User.find(session[:id]) unless user_signed_in?
  # end

  # private
  # 許可するキーを設定します
  # def user_params
  #   params.require(:user).permit(
  #     :nick_name,
  #     :email,
  #     :password, 
  #     :password_confirmation, 
  #     :name,
  #     :kana_name,
  #     :birthday,
  #     :payment_method
  # )
  # end
end