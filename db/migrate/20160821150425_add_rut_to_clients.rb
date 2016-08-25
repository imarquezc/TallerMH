class AddRutToClients < ActiveRecord::Migration
  def change
    add_column :clients, :rut, :string
  end
end
