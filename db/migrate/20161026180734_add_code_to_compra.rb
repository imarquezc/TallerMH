class AddCodeToCompra < ActiveRecord::Migration
  def change
    add_column :compras, :code, :string
  end
end
