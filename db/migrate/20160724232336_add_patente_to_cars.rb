class AddPatenteToCars < ActiveRecord::Migration
  def change
    add_column :cars, :patente, :string
  end
end
