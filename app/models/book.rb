class Book < ActiveRecord::Base
  
  def self.new_with_amazon_response(response_item)
    book = Book.new
    item_attributes = response_item.get_element('ItemAttributes')

    book.isbn = response_item.get('ASIN')
    book.detail_page_url = response_item.get('DetailPageURL')
    book.author = item_attributes.get('Author')
    book.title = item_attributes.get('Title')

    book.small_image_url = response_item.get_element('SmallImage').get('URL')
    book.medium_image_url = response_item.get_element('MediumImage').get('URL')
    book.large_image_url = response_item.get_element('LargeImage').get('URL')
    book
  end

end
