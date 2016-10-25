class Car < ActiveRecord::Base
    validates :marca, presence: true
    validates :modelo, presence: true
    validates :kilometraje, presence: true
    validates :patente, length: { is: 6 }, presence: true
    belongs_to :client
    has_many :works, dependent: :destroy
    before_save :upper


def self.search(search)
  if search and search != ""
    where('patente LIKE ?',"%#{search.upcase}%")
  else
    self.all
  end
end

def full_name
    self.marca + " " + self.modelo
end

private

def upper
    self.patente = self.patente.upcase
    self.marca = self.marca.capitalize
    self.modelo = self.modelo.capitalize
    self.chasis = self.chasis.upcase
end

end
