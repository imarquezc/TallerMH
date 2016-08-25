class AddWorkToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :work, index: true, foreign_key: true
  end
end
