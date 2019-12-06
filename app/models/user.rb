class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name,           presence: :true
  validates :name,                presence: :true
  validates :email,               presence: :true
  validates :encrypted_password,  presence: :true
  validates :kana_name,           presence: :true
  validates :birthday,            presence: :true
  validates :payment_method,      presence: :true

  # validates :name, presence: true,
  # format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}

end