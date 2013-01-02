class UsersController < ApplicationController
  before_filter :authenticate_user!

  def home
    @user = params[:user_name].present? ? User.find_by_name(params[:user_name]) : current_user
    #TODO 404かえす
    raise "404" unless @user
    @books = @user.books
  end

  def add_book
    book = Book.find_by_id(params[:book_id])
    #TODO 404かえす
    raise "404" unless book
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
    redirect_to(action: :home)
  end

end
