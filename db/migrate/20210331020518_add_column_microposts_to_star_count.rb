class AddColumnMicropostsToStarCount < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :star_count, :integer, limit: 5, null: false
  end
end
