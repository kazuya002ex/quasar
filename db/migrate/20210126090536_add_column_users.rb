class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :integer, limit: 1, default: 0, null: false
  end
end
