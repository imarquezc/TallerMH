class Client < ActiveRecord::Base
    validates :nombre, presence: true
    has_many :cars, dependent: :destroy
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, format: { with: VALID_EMAIL_REGEX }, :allow_blank => true
    validate :validate_mail_telefono_or_celular

def get_start_day
    self.created_at.day.to_s + "-" + self.created_at.month.to_s + "-" + self.created_at.year.to_s
end

def full_name
    self.nombre + " " + self.apellido
end

def self.search(search)
  if search and search != ""
    a = where('apellido LIKE ?',"%#{search}%") # + where('rut LIKE ?',"%#{search}%")
    a.uniq
  else
    self.all
  end
end

private

def validate_mail_telefono_or_celular
    unless[self.mail?, self.telefono?, self.celular?].include?(true)
        errors.add :base, "Por favor entregue un método de contacto (mail, teléfono y/o celular"
    end
end




end
