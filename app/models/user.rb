class User < ApplicationRecord
  has_secure_password
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_movies, through: :likes, source: :movie
  has_many :comments, dependent: :destroy
  has_many :movie_comments, through: :comments, source: :movie
  has_attached_file :image, storage: :cloudinary,
                             path: ':id/:style/:filename',
                             styles: { large: '1200x1000', medium: '300x300>' },
                             default_url: 'default_avatar.jpg'
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { case_sensitive: false }
end
