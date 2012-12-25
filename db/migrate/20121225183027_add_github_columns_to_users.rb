class AddGithubColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :github_user_id, :integer
  end
end
