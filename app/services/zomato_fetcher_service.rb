# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class ZomatoFetcherService
  def grab_place(restaurant)
    # Call API to retrieve the restaurant
    api_call_for_id = RestClient.get("https://developers.zomato.com/api/v2.1/search?q=#{restaurant.name.gsub(/\s/, '%20')}&lat=#{restaurant.latitude}&lon=#{restaurant.longitude}&apikey=#{ENV['ZOMATO_API_KEY']}&count=1")

    if api_call_for_id.body.empty?
      false # Returns false if the restaurant doesn't exist on Zomato.
    else
      zomato_restaurant_id = JSON.parse(api_call_for_id.body)["restaurants"][0]["restaurant"]["R"]["res_id"]
      restaurant.zomato_id = zomato_restaurant_id
      restaurant.save
      ReviewSeedingService.zomato_seed(restaurant)
      grab_reviews(restaurant)
      true
    end
  end

  def grab_reviews(restaurant) # rubocop:disable Metrics/MethodLength
    # API call to get the total review count and average rating
    api_call_for_count_average = RestClient.get("https://developers.zomato.com/api/v2.1/restaurant?res_id=#{restaurant.zomato_id}&apikey=#{ENV['ZOMATO_API_KEY']}")
    parsed_restaurant = JSON.parse(api_call_for_count_average.body)

    average_rating = parsed_restaurant["user_rating"]["aggregate_rating"]
    review_count = parsed_restaurant["all_reviews_count"]

    restaurant.zomato_average_rating.push(average_rating) unless average_rating.nil?
    restaurant.zomato_review_count.push(review_count) unless review_count.nil?
    restaurant.save

    # API call to get the reviews
    api_call_for_reviews = RestClient.get("https://developers.zomato.com/api/v2.1/reviews?res_id=#{restaurant.zomato_id}&apikey=#{ENV['ZOMATO_API_KEY']}")
    parsed_places = JSON.parse(api_call_for_reviews.body)["user_reviews"]
    parsed_places.each do |review|

      ZomatoReview.create(reviewer_image: review["review"]["user"]["profile_image"],
                          reviewer_username: review["review"]["user"]["name"],
                          reviewer_profile_url: review["review"]["user"]["profile_url"],
                          review_text: review["review"]["review_text"],
                          rating: review["review"]["rating"],
                          review_time: DateTime.strptime(review["review"]["timestamp"].to_s, "%s"),
                          review_time: review["review"]["timestamp"],
                          restaurant_id: restaurant.id)
    end
  end
end

# rubocop:enable Metrics/LineLength
