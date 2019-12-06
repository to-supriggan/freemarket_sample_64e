class Category < ApplicationRecord
  has_many :products
  validates :genre, presence: true, uniqueness: true
end
