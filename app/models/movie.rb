class Movie < ApplicationRecord
    def self.upcoming
        where('viewing_date > ?', Time.now)
    end
    
    def zero?
        self[:price].zero? 
    end

    def nothing?
        self[:price].nil?
    end
    
    
end
