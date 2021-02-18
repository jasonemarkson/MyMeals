class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :content, presence: true

  def self.recipes
    recipes = Recipe.all.order('name ASC')
  end
end
