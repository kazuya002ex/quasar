class CreateFreeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :free_comments do |t|
      t.string :content
      t.string :username
      t.references :post_id

      t.timestamps
    end
  end
end
