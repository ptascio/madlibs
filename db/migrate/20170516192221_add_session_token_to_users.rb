class AddSessionTokenToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :session_token, :string

    User.reset_column_information

    User.all.each do |user|
      user.session_token = user.created_at
      user.save!
    end
    add_index :users, :session_token, unique: true
    change_column :users, :session_token, :string, null: false
  end

  def down
    remove_column :users, :session_token, :string
  end
end
