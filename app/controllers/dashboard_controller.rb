
class DashboardController < ApplicationController
  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
    @restaurant = Restaurant.find_by(user_id: current_user)
    @all_reviews = @restaurant.restaurant_reviews
    @yelp_reviews = @restaurant.yelp_reviews
    @google_reviews = @restaurant.google_reviews
    @all_reviews = @yelp_reviews + @google_reviews
    @all_reviews_sorted = @all_reviews.sort_by {|r| r.rating}

    # @reviews_zomato = @restaurant.reviews_zomato.all

  end

  def explore
  end

  def scrape_tripadvisor
    url = params[:url]
    serialized = open(url).read
    parsed = Nokogiri.parse(serialized)
    for counter  in  1..10 do
      review = TaReview.new
      review.rating_date = parsed.search('.ratingDate')[counter].attributes['title']
      review.title = parsed.search('.noQuotes')[counter].text.strip
      review.review_link = parsed.search('.ui_column.is-9 div a')[counter].attributes['href'].value
      review.reviewer = parsed.search('.memberOverlayLink > .info_text.pointer_cursor')[counter].children.first.text
      rate = parsed.search('.ui_column.is-9')[0].children.first.attributes['class'].value
      # this returns a string like "ui_bubble_rating bubble_10" / 20 / 30 / 40 / 50 depending on the star rating
      review.rating = rate[-2].to_i
      review.save
    end
  end
end
