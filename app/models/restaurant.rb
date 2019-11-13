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


  def last_six_months_review_count(class_name)
    class_name.where(restaurant_id: self.id).where(review_time: (Date.today << 5)..Date.today).group_by_month(:review_time, format: "%b").count.to_json
  end

  def last_six_months_rating_average(class_name)
    reviews_by_month = class_name.where(restaurant_id: self.id).where(review_time: (Date.today << 5)..Date.today).group_by_month(&:review_time)
    average_ratings = []
    reviews_by_month.each do |date, reviews|
      average_rating = (reviews.map { |rev| rev.rating }.reduce { |number, next_num| number + next_num } / reviews.length).round(1)
      average_ratings << average_rating
    end
   average_ratings
  end

  def average_google_rating
    all_ratings = []
    self.google_reviews.each do |review|
      all_ratings << review.rating
    end
    (all_ratings.sum / all_ratings.length).round(1) unless all_ratings == []
  end

  def average_zomato_rating
    all_ratings = []
    self.zomato_reviews.each do |review|
      all_ratings << review.rating
    end
    (all_ratings.sum / all_ratings.length).round(1) unless all_ratings == []
  end

  def average_yelp_rating
    all_ratings = []
    self.yelp_reviews.each do |review|
      all_ratings << review.rating
    end
    (all_ratings.sum / all_ratings.length).round(1) unless all_ratings == []
  end

  def weeks_ratings_average(reviews)
    (reviews.pluck(:rating).sum / reviews.count).round(1)
  end

  def reviews_last_week
    today = Date.today
    self.restaurant_reviews.where(review_time: (today - (today.wday + 7))..(today - today.wday)).where('review_type != ?', "FoursquareReview")
  end

  def reviews_two_weeks_ago
    today = Date.today
    self.restaurant_reviews.where(review_time: (today - (today.wday + 14))..(today - (today.wday + 7))).where('review_type != ?', "FoursquareReview")
  end

  def week_review_count_comparision(week_reviews_count_one, week_reviews_count_two)
    if week_reviews_count_one > week_reviews_count_two
      difference = week_reviews_count_one - week_reviews_count_two
      "#{difference.to_s} more review#{"s" unless difference == 1} than the previous week"
    elsif week_reviews_count_one < week_reviews_count_two
      difference = week_reviews_count_two - week_reviews_count_one
      "#{difference.to_s} less review#{"s" unless difference == 1} than the previous week"
    elsif week_reviews_count_one == week_reviews_count_two
      "The same number of reviews as the previous week"
    end
  end

  def week_review_average_comparision(week_reviews_average_one, week_reviews_average_two)
    if week_reviews_average_one > week_reviews_average_two
      difference = (week_reviews_average_one - week_reviews_average_two).round(1)
      "Average rating was #{difference.to_s} points higher compared to the previous week"
    elsif week_reviews_average_one < week_reviews_average_two
      difference = (week_reviews_average_two - week_reviews_average_one).round(1)
      "Average rating was #{difference.to_s} points lower compared to the previous week"
    elsif week_reviews_average_one == week_reviews_average_two
      "Your average rating was the same as last week."
    end
  end
end
