class MediaItem < ApplicationRecord
    belongs_to :category

    validates :category_id, :url, presence: true
end
