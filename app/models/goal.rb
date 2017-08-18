class Goal < ApplicationRecord
    belongs_to  :category
    belongs_to  :user
    has_many    :days

    validates :title, :category_id, :user_id, presence: true
end
