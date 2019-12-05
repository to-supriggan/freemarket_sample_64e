class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :status, presense: true
end
