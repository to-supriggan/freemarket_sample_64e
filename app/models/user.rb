class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    if snscredential.present?
      user = User.find_by(id: snscredential.user_id)
    else
      user = User.find_by(email: auth.info.email)
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.new(
          nick_name: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          phone_number: "08000000000"
          )
        SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

  validates :nick_name,           presence: :true
  validates :email,               presence: :true, uniqueness: true
  validates :encrypted_password,  presence: :true
  validates :last_name,           presence: :true
  validates :first_name,          presence: :true
  validates :last_name_kana,      presence: :true
  validates :first_name_kana,     presence: :true
  validates :birth_year,          presence: :true
  validates :birth_month,         presence: :true
  validates :birth_day,           presence: :true
  validates :phone_number,        presence: :true, uniqueness: true
  
  has_many :products
  has_many :goods
  has_many :comments
  has_many :dealings
  has_many :addresses
  has_many :cards
  has_many :sns_credentials, dependent: :destroy
end