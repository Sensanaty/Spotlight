class RestaurantReview < ApplicationRecord
  belongs_to :restaurant
  belongs_to :review, polymorphic: true
end
