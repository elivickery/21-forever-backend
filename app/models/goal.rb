class Goal < ApplicationRecord
    belongs_to  :category
    belongs_to  :user
    has_many    :days

    validates :title, :category_id, :user_id, presence: true
    validate :only_one_active_goal

private
    def only_one_active_goal
        goals = User.find_by(id: self.user_id).goals
        if goals.where(archived: false, completed: false).length > 1
            errors.add(:user, "can only have one active goal")
        end
    end
end
