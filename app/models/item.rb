class Item < ActiveRecord::Base
    validates :nombre, presence: true
    validates :identificador, presence: true

def actualizar_stock(n)
    self.stock = self.stock + n
    self.save!
end

def auto_full_name
    if self.marca? and self.modelo?
        self.marca + " " + self.modelo
    elsif self.marca?
        self.marca
    elsif self.modelo?
        self.modelo
    else
        "Uso General"
    end
end

def comprobar_stock(n)
    return self.stock >= n.to_i
end

def usar(n)
    if !self.comprobar_stock(n)
        return false
    end
    precio = 0
    i = 0
    compras = Compra.where("producto = :ide and remaining > 0",{ide: self.id })
    while n > 0
        compra = compras[i]
        if compra.remaining >= n
            compra.remaining -= n
            precio += n * compra.p_venta
            compra.save
            self.stock -= n
            self.save
            return precio
        else
            precio += compra.remaining * compra.p_venta
            n -= compra.remaining
            self.stock -= compra.remaining
            self.save
            compra.remaining = 0
            compra.save
            i += 1
        end
    end
end

def self.search(search)
  if search and search != ""
    a = where('marca LIKE ?',"%#{search}%") + where('identificador LIKE ?',"%#{search}%") + where('nombre LIKE ?',"%#{search}%")
    a.uniq
  else
    self.all
  end
end
        
end
