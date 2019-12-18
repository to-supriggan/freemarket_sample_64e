class SignupController < ApplicationController
 # 各アクションごとに新規インスタンスを作成します
 # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
  def index
  end

  # def login
  # end

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nick_name] = user_params[:nick_name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new # 新規インスタンス作成
  end

  def step5
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  # def done
    # sign_in User.find(session[:id]) unless user_signed_in?
  # end


  # def step4
  #   # step3で入力された値をsessionに保存
  #   @user = User.new # 新規インスタンス作成
  # end

  # def step5
  #   # step4で入力された値をsessionに保存
  #   @user = User.new # 新規インスタンス作成
  # end

  def create
    @user = User.new(
      nick_name: session[:nick_name], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana], 
      birth_year: session[:birth_year], 
      birth_month: session[:birth_month], 
      birth_day: session[:birth_day], 
      phone_number: session[:phone_number], 
    )
    # binding.pry
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to signup_index_path
      # binding.pry
    else
      render '/signup/index' #変更 /signup/registration
    end
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
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number,
  )
  end
end

# session[:password_confirmation] = user_params[:password_confirmation]