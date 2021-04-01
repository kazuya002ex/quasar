class AddDefaultStarCountToMicroposts < ActiveRecord::Migration[6.1]
  def change
    change_column :microposts, :star_count, :integer, default: 0
  end
end
