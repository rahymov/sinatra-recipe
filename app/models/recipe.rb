class Recipe < ActiveRecord::Base
  belongs_to :user
  # validates_presence_of :full_name, :username,:email
end
