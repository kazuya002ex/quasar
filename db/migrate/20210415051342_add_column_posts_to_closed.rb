class AddColumnPostsToClosed < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :closed, :boolean, default: false, null: false
  end
end
