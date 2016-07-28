class Item < ActiveRecord::Base
    validates :nombre, presence: true
    after_initialize :init

def init
    self.stock ||= 0 
end

end
