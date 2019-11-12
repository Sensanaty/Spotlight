class Restaurant < ApplicationRecord
  CUISINES = %w[Italian French Pizza Western Turkish Greek Chinese Japanese Lebanese Indian Brazilian Thai Mexican Other] # rubocop:disable Metrics/LineLength
  mount_uploader :photo, PhotoUploader

  validates :name, :address, :cuisine, :price_level, presence: :true # rubocop:disable Lint/BooleanSymbol
  validates :cuisine, inclusion: { in: CUISINES }
  validates :price_level, inclusion: { in: [1, 2, 3, 4] }
  belongs_to :user
  has_many :restaurant_reviews
  has_many :google_reviews, through: :restaurant_reviews, source: :review, source_type: 'GoogleReview'
  has_many :zomato_reviews, through: :restaurant_reviews, source: :review, source_type: 'ZomatoReview'
  has_many :yelp_reviews, through: :restaurant_reviews, source: :review, source_type: 'YelpReview'
  has_many :four_square_reviews, through: :restaurant_reviews, source: :review, source_type: 'FoursquareReview'

  serialize :linked_channels
  serialize :channel_links_attempted

  serialize :yelp_review_count
  serialize :yelp_average_rating
  serialize :google_review_count
  serialize :google_average_rating
  serialize :foursquare_review_count
  serialize :foursquare_average_rating
  serialize :zomato_review_count
  serialize :zomato_average_rating
  serialize :tripadvisor_review_count
  serialize :tripadvisor_average_rating

  def average_google_rating
    all_ratings = []
    self.google_reviews.each do |review|
      all_ratings << review.rating
    end
    all_ratings.sum / all_ratings.length unless all_ratings == []
  end
end
