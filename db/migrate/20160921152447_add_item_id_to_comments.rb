class AddItemIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :item_id, :integer
    add_column :comments, :cantidad, :integer
  end
end
