class Movie < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :categorizations
  has_many :categories, through: :categorizations

  mount_uploader :avatar, AvatarUploader
  validates :name, :location, presence: true
  validates :description, length: { minimum: 15 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :avatar, format: { with: /\w+\.(png|jpg|jpeg)\z/i, message: 'Image should be PNG OR JPG or JPEG format' }
  
  scope :upcoming, lambda { where('viewing_date > ?', Time.now).order('viewing_date')}
  scope :released, -> { where('viewing_date < ?', Time.now).order('viewing_date')}
  scope :free, lambda { upcoming.where(price: 0.0).order('name')}
  scope :recent, -> (max= 3) { released.limit(max) }
  # Ex:- scope :active, lambda {where(:active => true)}
 

  def zero?
    self[:price].zero?
  end

  def nothing?
    self[:price].nil?
  end

  def sold_out?
    (capacity - registrations.size).zero?
  end
end
