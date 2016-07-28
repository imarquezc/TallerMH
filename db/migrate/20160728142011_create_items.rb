class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.integer :identificador
      t.text :descripcion
      t.integer :stock
      t.timestamps null: false
    end
  end
end
