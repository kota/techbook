# -*- encoding: utf-8 -*-
module UsersHelper
  #TODO book?に移動
  LEVEL_LABEL = ["持ってるけど未読","読んだ(半分以下)","全部読んだけどまだいまいち","完璧に理解した！"]
  COLORS = ["#000000","#b94a48","#c09853","#468847"]

  def book_level(book)
    user = @user ? @user : current_user
    user_book = user.user_books.find_by_book_id(book.id)
    "<span style='color:#{COLORS[user_book.level]}'>#{LEVEL_LABEL[user_book.level]}</span>"
  end
end
