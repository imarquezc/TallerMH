class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :motivo
      t.string :tipo
      t.integer :kilometraje
      t.integer :estanque

      t.timestamps null: false
    end
  end
end
