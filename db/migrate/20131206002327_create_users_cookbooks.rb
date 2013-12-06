class CreateUsersCookbooks < ActiveRecord::Migration
  def change
    create_table :users_cookbooks do |t|

      t.timestamps
    end
  end
end
