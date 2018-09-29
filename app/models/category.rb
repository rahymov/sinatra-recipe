class Category < ActiveRecord::Base
  has_many :recipes
  has_many :recipes, through: :recipe_categories
end
