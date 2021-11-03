class Movie < ApplicationRecord
    def free?
        price.zero? || price.blank?
    end
    
end
