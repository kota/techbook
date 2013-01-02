class UserBooksController < ApplicationController

  def update
    user_book = UserBook.find_by_id(params[:id])
    raise 'user_book not found' unless user_book
    raise 'invalid user' if user_book.user.id != current_user.id
    
    if comment = params[:user_book][:comment]
      user_book.update_attribute(:comment, comment)
    end
    redirect_to(controller: :users, action: :home)
  end

end
