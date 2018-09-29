class AddMissingTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :users, null: true
    add_timestamps :recipes, null: true
    add_timestamps :categories, null: true
  end
end
