class AmazonApi

  def self.search_by_keyword(keyword)
    Amazon::Ecs.item_search(keyword, {response_group: 'Medium', sort: 'salesrank', country: 'jp', search_index: 'Books', browse_node: 466298})
  end

  def self.search_by_isbn(isbn)
    Amazon::Ecs.item_lookup(keyword, {response_group: 'Medium', sort: 'salesrank', country: 'jp', id_type: 'ISBN', search_index: 'Books'})
  end

end
