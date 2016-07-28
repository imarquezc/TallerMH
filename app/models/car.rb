class Car < ActiveRecord::Base
    validates :marca, presence: true
    validates :modelo, presence: true
    validates :kilometraje, presence: true
    validates :patente, length: { is: 6 }, presence: true
    belongs_to :client


before_save :UpperPatente


private

def UpperPatente
    self.patente = self.patente.upcase
    self.marca = self.marca.capitalize
    self.modelo = self.modelo.capitalize
end

end
