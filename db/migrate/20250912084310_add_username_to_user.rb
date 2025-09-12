class AddUsernameToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username   # optional, non-unique
  end
end
