class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :comments
  has_many :images, inverse_of: :product, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :goods
  belongs_to :user
  has_one :dealings
  belongs_to :brand
  belongs_to :category
  validates  :name,                 presence: true
  validates  :information,          presence: true
  validates  :condition,            presence: true
  validates  :shipping_charge,      presence: true
  validates  :days_before_skipment, presence: true
  validates  :price,                presence: true
end
