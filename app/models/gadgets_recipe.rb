class GadgetsRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :gadget
end
