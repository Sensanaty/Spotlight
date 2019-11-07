class Restaurant < ApplicationRecord
  CUISINES = ["Italian", "French", "Pizza", "Western", "Turkish", "Greek", "Chinese", "Japanese", "Lebanese", "Indian", "Brazilian", "Thai", "Mexican", "Other"]
  mount_uploader :photo, PhotoUploader

  validates :name, :address, :cuisine, :price_level, presence: :true
  validates :cuisine, inclusion: { in: CUISINES }
  validates :price_level, inclusion: { in: [1, 2, 3] }
  belongs_to :user
  has_many :restaurant_reviews
  has_many :google_reviews, through: :restaurant_reviews, source: :review, source_type: 'GoogleReview'
  has_many :yelp_reviews, through: :restaurant_reviews, source: :review, source_type: 'YelpReview'
end
