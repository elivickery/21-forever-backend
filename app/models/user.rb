class User < ApplicationRecord
    has_many :goals

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: { minimum: 8 }
    validates :email, format: { with: /.+\@.+\..+/, message: "needs to be formatted ___@__.__" }
end
