crumb :root do
  link "メルカリ", root_path
end

crumb :index do
  link "マイページ", user_mypages_path(current_user)
  parent :root
end

crumb :credit_card_registration do
  link "支払い方法"
  parent :index
end

crumb :identification do
  link "本人情報"
  parent :index
end

crumb :profile_edit do
  link "プロフィール"
  
  parent :index
end

crumb :user_logout do
  link "ログアウト"
  parent :index
end