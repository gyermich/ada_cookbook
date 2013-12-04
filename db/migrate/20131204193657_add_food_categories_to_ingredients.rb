class AddFoodCategoriesToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :nuts, :boolean
    add_column :ingredients, :dairy, :boolean
    add_column :ingredients, :gluten, :boolean
    add_column :ingredients, :soy, :boolean
    add_column :ingredients, :corn, :boolean
    add_column :ingredients, :seafood, :boolean
  end
end
