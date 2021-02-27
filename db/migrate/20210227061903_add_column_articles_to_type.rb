class AddColumnArticlesToType < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :type, :integer, limit: 3, null: false
  end
end
