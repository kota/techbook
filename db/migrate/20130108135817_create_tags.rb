class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :name
      t.timestamps
    end
  end
end
