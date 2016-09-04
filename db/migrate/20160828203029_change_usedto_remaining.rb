class ChangeUsedtoRemaining < ActiveRecord::Migration
    rename_column :compras, :used, :remaining
end
