class AddMarcaToItems < ActiveRecord::Migration
  def change
    add_column :items, :marca, :string
  end
end
