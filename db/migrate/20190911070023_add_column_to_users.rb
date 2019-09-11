class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :my_title, :string
    add_column :users, :profile, :text
  end
end
