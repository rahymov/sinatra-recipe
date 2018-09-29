class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :categories
  has_many :categories, through: :recipe_categories
  
  validates_presence_of :title, :description, :ingredient, :directions

end
