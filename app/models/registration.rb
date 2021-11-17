class Registration < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  HOW_HEARD = [
    'Television',
    'Radio',
    'Newspaper',
    'Social media',
    'Friend and Family'
  ].freeze
  validates :heard, inclusion: { in: HOW_HEARD }
end
