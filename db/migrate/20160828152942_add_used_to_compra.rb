class AddUsedToCompra < ActiveRecord::Migration
  def change
    add_column :compras, :used, :integer
  end
end
