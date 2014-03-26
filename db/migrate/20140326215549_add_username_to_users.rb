class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :hashed_password, :string
    add_column :users, :salt, :string
  end
end
