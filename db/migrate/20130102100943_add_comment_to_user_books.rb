class AddCommentToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :comment, :text
  end
end
