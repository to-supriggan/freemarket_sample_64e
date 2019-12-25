class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      session[:provider] = session["devise.#{provider}_data"][:provider]
      session[:uid] = session["devise.#{provider}_data"][:uid]
      session[:email] = session["devise.#{provider}_data"][:info][:email]
      session[:nick_name] = session["devise.#{provider}_data"][:info][:name]
      session[:password] = SecureRandom.alphanumeric(30)
      render template: "signup/step1"
    end
  end

  def failure
    redirect_to root_path and return
  end
end