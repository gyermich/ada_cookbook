class CreateUsersCookbooks < ActiveRecord::Migration
  def change
    create_table :users_cookbooks do |t|
      t.integer :user_id
      t.integer :cookbook_id

      t.timestamps
    end
  end
end
