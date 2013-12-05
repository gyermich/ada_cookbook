class CreateGadgetsRecipes < ActiveRecord::Migration
  def change
    create_table :gadgets_recipes do |t|
      t.integer :gadget_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
