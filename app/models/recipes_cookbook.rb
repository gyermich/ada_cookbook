class RecipesCookbook < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :cookbook
end
