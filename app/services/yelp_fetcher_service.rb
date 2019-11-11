# rubocop:disable Lint/UselessAssignment
# rubocop:disable Metrics/MethodLength

require 'open-uri'
require 'json'

class YelpFetcherService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place(restaurant)
    # 1st API call
    id_uri = "https://api.yelp.com/v3/businesses/search?latitude=#{@latitude}&longitude=#{@longitude}"
    serialized_restaurants = RestClient.get(id_uri, headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
    parsed_restaurants = JSON.parse(serialized_restaurants)
    if parsed_restaurants['businesses'].empty?
      false # Returns false if the restaurant doesn't exist on Yelp.
    else
      yelp_restaurant_id = parsed_restaurants['businesses'][0]['id']
      grab_reviews(yelp_restaurant_id, restaurant)
      yelp_restaurant_id # Returns the Yelp restaurant ID to save to database if the restaurant exists on Yelp, after running the grab_reviews method.
    end
  end

  def grab_reviews(yelp_restaurant_id, restaurant)
    # Call API to get restaurant:
    restaurant_uri = "https://api.yelp.com/v3/businesses/#{yelp_restaurant_id}"
    serialized_restaurant = RestClient.get("#{restaurant_uri}", headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
    parsed_restaurant = JSON.parse(serialized_restaurant)

    # Get the total review count and average rating
    total_review_count = parsed_restaurant["review_count"]
    average_rating = parsed_restaurant["rating"]

    # Call API to get reviews:
    serialized_reviews = RestClient.get("#{restaurant_uri}/reviews", headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
    parsed_reviews = JSON.parse(serialized_reviews)

    # Save the reviews to the database
    parsed_reviews["reviews"].each do |review|
      YelpReview.create(reviewer_image: review["user"]["image_url"],
                        reviewer_username: review["user"]["name"],
                        reviewer_profile_url: review["user"]["profile_url"],
                        review_text: review["text"],
                        rating: review["rating"],
                        review_time: DateTime.parse(review["time_created"]).to_i, # Convert to UNIX time for storage
                        restaurant_id: spotlight_rest_id)
    end
  end
end

# rubocop:enable Lint/UselessAssignment
# rubocop:enable Metrics/MethodLength
