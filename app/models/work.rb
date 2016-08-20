class Work < ActiveRecord::Base
    belongs_to :car

def dd_mm_aaaa
    self.created_at.day.to_s + "-" + self.created_at.month.to_s + "-" + self.created_at.year.to_s
end

def hh_mm
    self.created_at.to_formatted_s(:time)
end

end
