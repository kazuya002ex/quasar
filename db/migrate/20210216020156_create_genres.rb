class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.text :desc

      t.timestamps
    end

    add_index :genres, :name
  end
end
