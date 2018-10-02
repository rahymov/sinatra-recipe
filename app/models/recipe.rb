class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  validates_presence_of :title, :description, :ingredient, :directions
  # include DataMapper::Resource
  #
  # property :id, Serial

  # mount_uploader :source, ImageUploader

  def self.search(search)
    where("name like ?", "%#{search}%")
  end
  
end
