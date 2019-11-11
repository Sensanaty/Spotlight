class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
    @review = RestaurantReview.first
    @restaurant = Restaurant.find_by(user_id: current_user)
    if params[:query]
      ratings = params[:query]
      @all_reviews = @restaurant.restaurant_reviews.select { |e| e.rating == ratings.to_f }
    else
      @all_reviews = @restaurant.restaurant_reviews
    end
    @all_reviews_sorted = @all_reviews.sort_by(&:review_time).reverse
  end

  def explore
    @restaurant = Restaurant.find_by(user_id: current_user)
  end
end
