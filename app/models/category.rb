class Category < ApplicationRecord
  has_many :products

  validates :genre, presense: true, uniqueness: true
end
