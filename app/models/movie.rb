class Movie < ApplicationRecord
  has_many :registrations
  mount_uploader :avatar, AvatarUploader
  validates :name, :location, presence: true
  validates :description, length: { minimum: 15 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :avatar, format: { with: /\w+\.(png|jpg|jpeg)\z/i, message: 'Image should be PNG OR JPG or JPEG format' }
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
