class Adress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  validates  :postal_cord, presence: true
  validates  :city,        presence: true
  validates  :street_num,  presence: true
end
