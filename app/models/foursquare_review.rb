class FoursquareReview < ApplicationRecord
  has_one :restaurant_review, as: :review
  has_one :restaurant, through: :restaurant_review

  after_create :generate_restaurant_review

  def generate_restaurant_review
    RestaurantReview.create(
      restaurant_id: self.restaurant_id,
      review: self,
      review_time: self.review_time, # check with Luca on new date name for google review
      )
  end
end
