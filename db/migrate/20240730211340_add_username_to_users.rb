class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string

    User.reset_column_information
    User.update_all("username = email")

    add_index :users, :username, unique: true

    change_column_null :users, :username, false
  end
end
