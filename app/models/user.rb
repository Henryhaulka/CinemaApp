class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, 
             uniqueness: {case_sensitive: false}
end
