class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments
  has_many :images, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :goods
  has_one :dealing
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  belongs_to_active_hash :prefecture
  validates  :name,                 presence: true
  validates  :information,          presence: true
  validates  :condition,            presence: true
  validates  :shipping_charge,      presence: true
  validates  :days_before_skipment, presence: true
  validates  :price,                presence: true
end
