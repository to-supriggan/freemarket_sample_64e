class Category < ApplicationRecord
  has_many :products
  has_ancestry
  validates :genre, presence: true
end
