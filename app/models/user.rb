class User < ApplicationRecord
  has_secure_password
  mount_uploader :user_image, UserImageUploader
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_movies, through: :likes, source: :movie
  has_many :comments, dependent: :destroy
  has_many :movie_comments, through: :comments, source: :movie

  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { case_sensitive: false }
end
