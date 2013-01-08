class Tag < ActiveRecord::Base
  has_many :books, through: :tag_books
  has_many :tag_books
end
