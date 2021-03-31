class CreateMicropostStars < ActiveRecord::Migration[6.1]
  def change
    create_table :micropost_stars do |t|
      t.references :user, index: true
      t.references :micropost, index: true

      t.timestamps
    end
  end
end
