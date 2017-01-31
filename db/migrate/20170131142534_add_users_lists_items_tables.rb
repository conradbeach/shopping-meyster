class AddUsersListsItemsTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end

    create_table :lists do |t|
      t.string :name

      t.timestamps
    end

    create_table :items do |t|
      t.string :name

      t.timestamps
    end
  end
end
