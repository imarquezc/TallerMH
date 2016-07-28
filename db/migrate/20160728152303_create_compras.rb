class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :producto
      t.integer :p_compra
      t.integer :p_venta
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
