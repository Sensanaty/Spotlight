class GoogleReview < ApplicationRecord
  has_one :restaurant_review, as: :review
  has_one :restaurant, through: :restaurant_review
  validates :review_time, uniqueness: :true

  after_create :generate_restaurant_review

  def generate_restaurant_review
    RestaurantReview.create(
      restaurant_id: restaurant_id,
      review: self,
      review_time: review_time, # check with Luca on new date name for google review
      rating: rating # check for naming/type of rating in google review
    )
  end

  def get_review_datetime
    DateTime.strptime(self.review_time.to_s, '%s')
  end
end
