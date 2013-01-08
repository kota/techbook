class CreateTagBooks < ActiveRecord::Migration
  def change
    create_table :tag_books do |t|
      t.integer :book_id
      t.integer :tag_id
      t.timestamps
    end
    add_index :tag_books, :book_id
    add_index :tag_books, :tag_id
  end
end
