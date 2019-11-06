class DashboardController < ApplicationController
  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
    # @restaurant = Restaurant.find_by(user_id: current_user)
    # @yelp_reviews = @restaurant.yelp_reviews.all.sort_by(&:rating)
    # @reviews_google = @restaurant.reviews_google.all
    # @reviews_zomato = @restaurant.reviews_zomato.all
  end

  def explore
  end
end