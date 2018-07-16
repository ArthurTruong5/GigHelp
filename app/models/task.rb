class Task < ApplicationRecord
    include PgSearch

    scope :sorted, ->{ order(title: :asc) }

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

  multisearchable :against => [:title]

  def self.perform_search(keyword)
    if keyword.present?
    then Task.search(keyword)
    logger.debug("3333333")
    else Task.all
    end.sorted
  end


  mount_uploader :image, ImageUploader
  has_many :bids, dependent: :destroy
  # belongs_to :user
end
