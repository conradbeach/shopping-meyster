class AddListItemsTable < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :item_id
      t.float :quantity
      t.boolean :completed

      t.timestamps
    end
  end
end
