class CreateRecipesCookbooks < ActiveRecord::Migration
  def change
    create_table :recipes_cookbooks do |t|
      t.integer :recipe_id
      t.integer :cookbook_id

      t.timestamps
    end
  end
end
