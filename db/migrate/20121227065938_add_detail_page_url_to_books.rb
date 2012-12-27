class AddDetailPageUrlToBooks < ActiveRecord::Migration
  def change
    add_column :books, :detail_page_url, :text
  end
end
