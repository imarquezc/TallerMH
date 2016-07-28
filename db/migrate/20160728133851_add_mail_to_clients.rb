class AddMailToClients < ActiveRecord::Migration
  def change
    add_column :clients, :mail, :string
  end
end
