class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :comuna
      t.string :telefono
      t.string :celular

      t.timestamps null: false
    end
  end
end
