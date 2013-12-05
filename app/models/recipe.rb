class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :recipes_cookbooks
  has_many :cookbooks, through: :recipes_cookbooks
end
