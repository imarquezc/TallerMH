class ChangeDataTypeForIdentificador < ActiveRecord::Migration
    def change
        change_column(:items, :identificador, :string)
    end
end