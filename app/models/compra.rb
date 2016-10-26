class Compra < ActiveRecord::Base
    after_create :actualizar_stock

    def actualizar_stock
        item = Item.find(self.producto)
        item.actualizar_stock(self.cantidad.to_i)
    end    


    def edit_stock(nueva_cantidad)
        cambio = (nueva_cantidad - self.cantidad)

        if nueva_cantidad == self.cantidad
            return true
        else
            if -cambio > self.remaining
                errors.add :base, "Cantidad Inválida, quedaría un stock negativo."
                return false
            end 
            self.remaining += cambio
            item = Item.find(self.producto)
            item.actualizar_stock(cambio)
            self.save!
            return true
        end
        
    end

end
