class Task < ApplicationRecord
  include PgSearch

     pg_search_scope :search,
                     against: [
                       :title
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
  has_many :bids, dependent: :destroy



end
