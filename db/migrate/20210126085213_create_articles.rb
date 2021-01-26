class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false 
      t.text :content, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end

    add_index :articles, :title
  end
end
