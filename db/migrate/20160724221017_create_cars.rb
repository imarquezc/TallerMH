class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :marca
      t.string :modelo
      t.integer :kilometraje
      t.string :color
      t.text :comentarios
      t.timestamps null: false
    end
  end
end
