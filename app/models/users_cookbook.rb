class UsersCookbook < ActiveRecord::Base
  belongs_to :user
  belongs_to :cookbook
end
