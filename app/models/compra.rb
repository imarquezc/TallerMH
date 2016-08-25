class Compra < ActiveRecord::Base
    after_create :actualizar_stock

    def actualizar_stock
        item = Item.find_by_identificador(self.producto)
        item.stock += self.cantidad
        item.save
    end


end
