class AddBrowsingToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :browsing, :integer, null: false, default: 0
  end
end
