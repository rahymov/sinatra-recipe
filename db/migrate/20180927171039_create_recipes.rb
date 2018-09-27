class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredient
      t.text :directions
      t.integer :user_id
      t.string :image
    end
  end
end
