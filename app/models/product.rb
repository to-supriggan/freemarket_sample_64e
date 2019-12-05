class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :comments
  has_many :images
  has_many :goods
  belongs_to :user
  belongs_to :transaction
  belongs_to :brand
  belongs_to :category
  validates  :name,                 presence: true
  validates  :information,          presence: true
  validates  :condition,            presence: true
  validates  :shipping_charge,      presence: true
  validates  :shipping_area,        presence: true
  validates  :days_before_skipment, presence: true
  validates  :price,                presence: true
  validates  :evaluation,           presence: true
  validates  :prefecture_id,        presence: true
end
