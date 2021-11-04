class Movie < ApplicationRecord
    def zero?
        self[:price].zero? 
    end

    def nothing?
        self[:price].nil?
    end
    
    
end
