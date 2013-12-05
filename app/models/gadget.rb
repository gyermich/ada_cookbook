class Gadget < ActiveRecord::Base
  has_many :gadgets_recipes
  has_many :recipes, through: :gadgets_recipes
end
