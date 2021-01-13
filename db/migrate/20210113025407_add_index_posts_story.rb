class AddIndexPostsStory < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, :title
    change_column_null :posts, :story, false
    change_column_null :posts, :order, false
  end
end
