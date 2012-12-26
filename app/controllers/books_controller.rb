class BooksController < ApplicationController

  def show
    @book = Book.find_by_isbn(params[:id])
    if current_user
      user_book = current_user.user_books.find_by_book_id(@book.id)
      if user_book
        @user_level = user_book.level
      end
    end
  end
  
  def search
    result = AmazonApi.search_by_keyword(params[:keyword])
    new_books = []
    @books = result.items.map do |item|
      book = Book.find_by_isbn(item.get_element('ItemAttributes').get('ISBN'))
      if book.nil?
        book = Book.new_with_amazon_response(item)
        new_books << book
      end
      book
    end
    Book.import(new_books)
    
  end

end
