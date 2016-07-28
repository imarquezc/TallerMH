class AddTipoToCars < ActiveRecord::Migration
  def change
    add_column :cars, :tipo, :string
  end
end
