class Brand < ApplicationRecord
  has_many :products
  
  validates :name, presense: true, uniqueness: true
end
