class AddIndexUsersName < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :name
    change_column_null :users, :name, false
  end
end
