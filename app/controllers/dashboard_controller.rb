class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
    @review = RestaurantReview.first
    @restaurant = Restaurant.find_by(user_id: current_user)
    @review_types = @restaurant.restaurant_reviews.pluck(:review_type).uniq
    @all_reviews = @restaurant.restaurant_reviews
    if params[:rating].present?
      @all_reviews = @all_reviews.where(rating: params[:rating])
    end
    # Leave in code -> if we have time we use this to refactor the way we pull the reviews. Now we use CSS which pulls all.
    # if params[:type].present?
    #   @all_reviews = @all_reviews.where(review_type: params[:type])
    # end
    @all_reviews_sorted = @all_reviews.sort_by {|obj| obj.review_time}.reverse
  end

  def explore
    @restaurant = Restaurant.find_by(user_id: current_user)
    @markers = MapBoxCompetitionFetcherService.new(@restaurant.cuisine, @restaurant.latitude, @restaurant.longitude).grab_place
    @markers.each do |marker|
      puts marker
      marker[:infoWindow] = render_to_string(partial: "restaurants/info_window", locals: { restaurant: marker })
      marker[:cuisine] = @restaurant.cuisine
    end
    @my_resto = [{ lat: @restaurant.latitude, lng: @restaurant.longitude, image_url: helpers.asset_url('homeicon.png'), infoWindow: render_to_string(partial: "restaurants/info_window", locals: { restaurant: @restaurant })} ]
  end
end


