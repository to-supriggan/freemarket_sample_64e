class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :goods
  has_many :comments
  has_many :dealing
  has_many :addresses
  validates :nick_name,           presence: :true
  validates :name,                presence: :true
  validates :email,               presence: :true
  validates :encrypted_password,  presence: :true
  validates :kana_name,           presence: :true
  validates :birthday,            presence: :true
  validates :payment_method,      presence: :true
end