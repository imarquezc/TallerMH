class Item < ActiveRecord::Base
    validates :nombre, presence: true
    after_initialize :init

def init
    self.stock ||= 0 
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

def self.search(search)
  if search and search != ""
    a = where('marca LIKE ?',"%#{search}%") + where('identificador LIKE ?',"%#{search}%") + where('nombre LIKE ?',"%#{search}%")
    a.uniq
  else
    self.all
  end
end
        
end
