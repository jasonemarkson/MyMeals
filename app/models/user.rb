class User < ApplicationRecord
    has_many :recipes #that they created
    has_many :reviews
    has_many :reviewed_recipes, through: :reviews, source: :recipe
    has_secure_password
    validates :name, :email, :username, :password_digest, presence: true
    validates :username, uniqueness: true
end
