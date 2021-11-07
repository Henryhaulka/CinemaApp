class Registration < ApplicationRecord
    belongs_to :movie
    validates :name, presence: true
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

    HOW_HEARD = [
        "Television",
        "Radio",
        'Newspaper',
        'Social media',
        'Friend and Family'
    ]
    validates :heard, inclusion: {in: HOW_HEARD }
end
