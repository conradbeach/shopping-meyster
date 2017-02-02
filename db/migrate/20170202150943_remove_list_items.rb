class RemoveListItems < ActiveRecord::Migration
  def change
    drop_table :list_items

    add_column :items, :quantity, :float
    add_column :items, :completed, :boolean
  end
end
