class Recipe < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :title, :description, :ingredient, :directions
end
