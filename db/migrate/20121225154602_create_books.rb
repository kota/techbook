class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.text :title
      t.text :author
      t.integer :page
      t.text :description
      t.integer :price
      t.timestamps
    end
  end
end
