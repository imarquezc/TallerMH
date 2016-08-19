class AddCarToWorks < ActiveRecord::Migration
  def change
    add_reference :works, :car, index: true, foreign_key: true
  end
end
