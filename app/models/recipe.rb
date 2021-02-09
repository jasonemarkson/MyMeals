class Recipe < ApplicationRecord
    belongs_to :user #the user that created
    has_many :reviews
	has_many :users, through: :reviews
end
