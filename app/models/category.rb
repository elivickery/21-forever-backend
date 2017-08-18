class Category < ApplicationRecord
    has_many :media_items
    has_many :goals
end
