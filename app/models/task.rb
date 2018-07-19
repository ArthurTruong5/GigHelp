class Task < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  include PgSearch
     pg_search_scope :search,
                     against: [
                       :title,
                       :location
                     ],
                     using: {
                       tsearch: {
                         prefix: true,
                         normalization: 2
                       }
                     }
  def self.perform_search(keyword)
    if keyword.present?
    then Task.search(keyword)
    else Task.all
    end
  end


  mount_uploader :image, ImageUploader
  validates :image, presence: true
  has_many :bids, dependent: :destroy
  has_many :locations, dependent: :destroy



end
