class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  validates  :last_name,       presence: true
  validates  :first_name,      presence: true
  validates  :last_name_kana,  presence: true
  validates  :first_name_kana, presence: true
  validates  :postal_cord,     presence: true
  validates  :city,            presence: true
  validates  :street_num,      presence: true
end
