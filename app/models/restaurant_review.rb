class RestaurantReview < ApplicationRecord
  belongs_to :restaurant
  belongs_to :review, polymorphic: true

  include PgSearch::Model
  pg_search_scope :search_by_rating, against: [:rating]

end
