class Compra < ActiveRecord::Base
    after_create :actualizar_stock

    def actualizar_stock
        item = Item.find(self.producto)
        item.actualizar_stock(self.cantidad.to_i)
    end    
end
