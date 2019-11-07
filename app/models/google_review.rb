class GoogleReview < ApplicationRecord
  has_one :restaurant_review, as: :review
  has_one :restaurant, through: :restaurant_review

  after_create :generate_restaurant_review

  def generate_restaurant_review
    RestaurantReview.create(
      restaurant_id: self.restaurant_id,
      review: self,
      date: self.review_date, #check with Luca on new date name for google review
      rating: self.rating #check for naming/type of rating in google review
      )
  end
end
