class TripadvisorReview < ApplicationRecord
  validates :review_time, uniqueness: :true
end
