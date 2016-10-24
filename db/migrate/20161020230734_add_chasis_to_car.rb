class AddChasisToCar < ActiveRecord::Migration
  def change
    add_column :cars, :chasis, :string
  end
end