class ChangeDataTypeForCometario < ActiveRecord::Migration
    def change
        change_column(:cars, :comentarios, :text)
    end
end
