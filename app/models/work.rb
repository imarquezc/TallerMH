class Work < ActiveRecord::Base
    belongs_to :car

def dd_mm_aaaa
    self.created_at.day.to_s + "-" + self.created_at.month.to_s + "-" + self.created_at.year.to_s
end

end
