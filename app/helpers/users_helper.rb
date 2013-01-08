# -*- encoding: utf-8 -*-
module UsersHelper
  #TODO book?に移動
  LEVEL_LABEL = ["持ってるけど未読","読んだ(半分以下)","読んだけどまだいまいち","だいたい理解した"]
  COLORS = ["#000000","#b94a48","#c09853","#468847"]

  def user_book(book)
    user_book = @user.user_books.find_by_book_id(book.id)
    "<span>
    <p style='color:#{COLORS[user_book.level]}'>#{LEVEL_LABEL[user_book.level]}</p>
    <p> #{h user_book.comment} </p>
    </span>"
  end
end
