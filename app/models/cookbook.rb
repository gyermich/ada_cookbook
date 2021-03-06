class Cookbook < ActiveRecord::Base
  has_many :recipes_cookbooks
  has_many :recipes, through: :recipes_cookbooks
  has_many :users_cookbooks
  has_many :users, through: :users_cookbooks
end
