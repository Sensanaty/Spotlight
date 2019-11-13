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
    (all_ratings.sum / all_ratings.length).round(1) unless all_ratings == []
  end

  def google_last_six_months_review_count
    self.google_reviews.where(review_time: (Date.today << 6)..Date.today).group_by_month(:review_time, format: "%b").count.to_json
  end

  def google_last_six_months_rating_average
    reviews_by_month = self.google_reviews.where(review_time: (Date.today << 6)..Date.today).group_by_month(&:review_time)
    average_ratings = []
    reviews_by_month.each do |date, reviews|
      average_rating = reviews.map { |rev| rev.rating }.reduce { |number, next_num| number + next_num } / reviews.length
      average_ratings << average_rating
    end
   average_ratings
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

  def average_foursquare_rating
    all_ratings = []
    self.google_reviews.each do |review|
      all_ratings << review.rating
    end
    (all_ratings.sum / all_ratings.length).round(1) unless all_ratings == []
  end

  def week_name(num_weeks_ago) # This takes a negative integer. EG -2 is the week before this week.
    self.restaurant_reviews.group_by_week(:review_time, format: "%d " "%b %Y").count.to_a[num_weeks_ago][0]
  end

  def week_reviews_average(num_weeks_ago)   # This takes a negative integer. EG -2 is the week before this week.
    reviews = self.restaurant_reviews.group_by_week(&:review_time).to_a[num_weeks_ago][1]
    ratings = []
    reviews.each do |r|
      ratings << r.rating
    end
    (ratings.sum / ratings.length).round(1) unless ratings == []
  end

  def week_reviews_count(num_weeks_ago) # This takes a negative integer. EG -2 is the week before this week.
    self.restaurant_reviews.group_by_week(:review_time, format: "%d " "%b %Y").count.to_a[num_weeks_ago][1]
  end

  def week_review_count_comparision(num_weeks_ago_one, num_weeks_ago_two) # Provide two weeks using negative numbers (weeks since current week) to compare
    week_reviews_count_one = week_reviews_count(num_weeks_ago_one)
    week_reviews_count_two = week_reviews_count(num_weeks_ago_two)

    if week_reviews_count_one > week_reviews_count_two
      difference1 = week_reviews_count_one - week_reviews_count_two
      "#{difference1.to_s} more review#{"s" unless difference1 == 1} than the previous week"
    elsif week_reviews_count_one < week_reviews_count_two
      difference1 = week_reviews_count_two - week_reviews_count_one
      "#{difference1.to_s} less review#{"s" unless difference1 == 1} than the previous week"
    elsif week_reviews_count_one == week_reviews_count_two
      "The same number of reviews as the previous week"
    end
  end

  def week_review_average_comparision(num_weeks_ago_one, num_weeks_ago_two) # Provide two weeks using negative numbers (weeks since current week) to compare
    week_reviews_average_one = week_reviews_average(num_weeks_ago_one)
    week_reviews_average_two = week_reviews_average(num_weeks_ago_two)

    if week_reviews_average_one > week_reviews_average_two
      difference2 = week_reviews_average_one - week_reviews_average_two
      "Average rating was #{difference2.to_s} better compared to the previous week"
    elsif week_reviews_average_one < week_reviews_average_two
      difference2 = week_reviews_average_two - week_reviews_average_one
      "Average rating was #{difference2.to_s} worse compared to the previous week"
    elsif week_reviews_average_one == week_reviews_average_two
      "Your average rating was the same as last week."
    end
  end
end
