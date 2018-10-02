class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :images, :string
  end
end
