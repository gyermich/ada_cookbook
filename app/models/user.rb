class User < ActiveRecord::Base
  has_many :users_cookbooks
  has_many :coocbooks, through: :users_cookbooks
end
