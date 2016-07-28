class AddClientToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :client, index: true, foreign_key: true
  end
end