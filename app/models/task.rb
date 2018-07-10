class Task < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :bids, dependent: :destroy
end
