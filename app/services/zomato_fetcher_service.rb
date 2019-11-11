# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class ZomatoFetcherService
  def grab_place(restaurant)
    # Call API to retrieve the restaurant
    lat = restaurant.latitude
    long = restaurant.longitude
    api_call_for_id = RestClient.get("https://developers.zomato.com/api/v2.1/search?q=#{@restaurant.name.gsub(/\s/, '%20')}&lat=#{lat}&lon=#{long}&apikey=#{ENV['ZOMATO_API_KEY']}&count=1")

    if first_rest_request.body.empty?
      false # Returns false if the restaurant doesn't exist on Zomato.
    else
      # Parse the API call data to JSON then save the zomato ID, run the grab_reviews method.
      zomato_restaurant_id = JSON.parse(api_call_for_id.body)["restaurants"][0]["restaurant"]["R"]["res_id"]
      restaurant.zomato_id = zomato_restaurant_id
      restaurant.save
      grab_reviews(restaurant)
      true # Returns true if the restaurant exists on Zomato, after running the grab_reviews method.
    end
  end

  def grab_reviews(restaurant) # rubocop:disable Metrics/MethodLength
    # API call to get the total review count and average rating
    api_call_for_count_average = RestClient.get("https://developers.zomato.com/api/v2.1/restaurant?res_id=#{restaurant.zomato_id}&apikey=#{ENV['ZOMATO_API_KEY']}")
    parsed_restaurant = JSON.parse(api_call_for_count_average.body)

    restaurant. = parsed_restaurant["user_rating"]["aggregate_rating"]
    total_review_count = parsed_restaurant["all_reviews_count"]

    # API call to get the reviews
    api_call_for_reviews = RestClient.get("https://developers.zomato.com/api/v2.1/reviews?res_id=#{restaurant.zomato_id}&apikey=#{ENV['ZOMATO_API_KEY']}")
    parsed_places = JSON.parse(api_call_for_reviews.body)["user_reviews"]
    parsed_places.each do |review|
      ZomatoReview.create(reviewer_image: review["review"]["user"]["profile_image"],
                          reviewer_username: review["review"]["user"]["name"],
                          reviewer_profile_url: review["review"]["user"]["profile_url"],
                          review_text: review["review"]["review_text"],
                          rating: review["review"]["rating"],
                          review_time: review["review"]["timestamp"],
                          restaurant_id: restaurant.id)
    end
  end
end

# rubocop:enable Metrics/LineLength
