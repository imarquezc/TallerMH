class Comment < ActiveRecord::Base
    belongs_to :work
    validates :detalle, presence: true
    validates :precio, presence: true
end
