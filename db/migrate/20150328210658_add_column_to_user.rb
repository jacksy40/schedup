class AddColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_column :users, :avatar_url, :string
  end
  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :username
    remove_column :users, :avatar_url
  end
end
