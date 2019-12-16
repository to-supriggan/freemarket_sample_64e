class Image < ApplicationRecord
  belongs_to :product, inverse_of: :images
  validates  :image, presence: true
  mount_uploader :image, ImageUploader
end
