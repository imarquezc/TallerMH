class AddAnoToCars < ActiveRecord::Migration
  def change
    add_column :cars, :año, :integer
  end
end
