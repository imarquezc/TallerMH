class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :detalle
      t.integer :precio

      t.timestamps null: false
    end
  end
end
