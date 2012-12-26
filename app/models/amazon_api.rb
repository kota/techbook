class AmazonApi
  ASSOCIATE_TAG = ENV['AMAZON_ASSOCIATE_TAG']
  ACCESSKEY_ID = ENV['AMAZON_ACCESS_KEY_ID']
  SECRET_KEY = ENV['AMAZON_SECRET_KEY']

  def self.search
    Amazon::Ecs.configure do |options|
      options[:associate_tag] = ASSOCIATE_TAG
      options[:AWS_access_key_id] = ACCESSKEY_ID
      options[:AWS_secret_key] = SECRET_KEY
    end
    Amazon::Ecs.item_lookup('4334764843', {response_group: 'Medium', sort: 'salesrank', country: 'jp', id_type: 'ISBN', search_index: 'Books'})
  end
end
