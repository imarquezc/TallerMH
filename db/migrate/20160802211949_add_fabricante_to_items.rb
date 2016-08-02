class AddFabricanteToItems < ActiveRecord::Migration
  def change
    add_column :items, :fabricante, :string
    add_column :items, :modelo, :string
  end
end
