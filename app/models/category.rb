class Category < ApplicationRecord
    has_many :categorizations
    has_many :movies, through: :categorizations
end
