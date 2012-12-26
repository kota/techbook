class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.text :title
      t.text :author
      t.integer :page
      t.text :description
      t.integer :price
      t.string :small_image_url
      t.string :medium_image_url
      t.string :large_image_url
      t.timestamps
    end
    add_index :books, :isbn
  end
end
