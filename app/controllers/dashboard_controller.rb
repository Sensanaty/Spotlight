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
    puts @restaurant.latitude
    puts @restaurant.longitude
    @markers = MapBoxCompetitionFetcherService.new(@restaurant.cuisine, @restaurant.latitude, @restaurant.longitude).grab_place
  end
end

# def scrape_tripadvisor
#   url = params[:url]
#   serialized = open(url).read
#   parsed = Nokogiri.parse(serialized)
#   for counter  in  1..10 do
#     review = TaReview.new
#     review.rating_date = parsed.search('.ratingDate')[counter].attributes['title']
#     review.title = parsed.search('.noQuotes')[counter].text.strip
#     review.review_link = parsed.search('.ui_column.is-9 div a')[counter].attributes['href'].value
#     review.reviewer = parsed.search('.memberOverlayLink > .info_text.pointer_cursor')[counter].children.first.text
#     rate = parsed.search('.ui_column.is-9')[0].children.first.attributes['class'].value
#     # this returns a string like "ui_bubble_rating bubble_10" / 20 / 30 / 40 / 50 depending on the star rating
#     review.rating = rate[-2].to_i
#     review.save
#   end
# end

# def feed
#   @review = RestaurantReview.first
#   @restaurant = Restaurant.find_by(user_id: current_user)
#   if params[:query]
#     ratings = params[:query]
#     ratings = ratings.map { |v| v.to_f }
#     @all_reviews = @restaurant.restaurant_reviews.select { |e| ratings.include?(e.rating) }
#     @all_reviews_sorted = @all_reviews.sort_by {|obj| obj.review_time}.reverse
#   else
#     @all_reviews = @restaurant.restaurant_reviews
#     @all_reviews_sorted = @all_reviews.sort_by {|obj| obj.review_time}.reverse
#   end
# end
