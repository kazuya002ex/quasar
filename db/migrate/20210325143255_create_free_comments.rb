class CreateFreeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :free_comments do |t|
      t.string :content, null: false
      t.string :username, null: false
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
