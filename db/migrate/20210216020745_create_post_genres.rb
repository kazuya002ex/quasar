class CreatePostGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :post_genres do |t|
      t.references :post, index: true
      t.references :genre, index: true

      t.timestamps
    end
  end
end
