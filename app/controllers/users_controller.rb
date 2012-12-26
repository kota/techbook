class UsersController < ApplicationController
  before_filter :authenticate_user!

  def home
    #TODO Githubっぽく/kotaとかで他の人の本を見れるようにする
    @books = current_user.books
  end

  def add_book
    book = Book.find_by_id(params[:book_id])
    if book
      if current_user.books.find{|own_book| own_book.id == book.id}
        user_book = current_user.user_books.find_by_book_id(book.id)
        if user_book.level != params[:level].to_i
          user_book.update_attribute(:level, params[:level].to_i)
        end
      else
        current_user.books << book
        current_user.save!
        user_book = current_user.user_books.find_by_book_id(book.id)
        user_book.update_attribute(:level, params[:level].to_i)
      end
    end
    redirect_to(action: :home)
  end

end
