class Book < ActiveRecord::Base
  has_many :tags, through: :tag_books
  has_many :tag_books
  
  def self.new_with_amazon_response(response_item)
    book = Book.new
    item_attributes = response_item.get_element('ItemAttributes')

    book.isbn = response_item.get('ASIN')
    book.detail_page_url = response_item.get('DetailPageURL')
    book.author = item_attributes.get('Author')
    book.title = item_attributes.get('Title')

    book.small_image_url = response_item.get_element('SmallImage').get('URL') if response_item.get_element('SmallImage')
    book.medium_image_url = response_item.get_element('MediumImage').get('URL') if response_item.get_element('MediumImage')
    book.large_image_url = response_item.get_element('LargeImage').get('URL') if response_item.get_element('LargeImage')
    book
  end

  def medium_or_no_image_url
    medium_image_url.nil? ? "/images/noimage.png" : medium_image_url
  end

end
