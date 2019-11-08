# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class ZomatoFetcherService
  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place(relate_restaurant_id) # rubocop:disable Metrics/MethodLength
    # 1st API call
    lat = @latitude
    long = @longitude
    first_rest_request = RestClient.get("https://developers.zomato.com/api/v2.1/search?q=#{@name.gsub(/\s/, '%20')}&lat=#{lat}&lon=#{long}&apikey=#{ENV['ZOMATO_API_KEY']}&count=1")
    restaurant_id = JSON.parse(first_rest_request.body)["restaurants"][0]["restaurant"]["R"]["res_id"]

    # 2nd API call
    second_rest_request = RestClient.get("https://developers.zomato.com/api/v2.1/reviews?res_id=#{restaurant_id}&apikey=#{ENV['ZOMATO_API_KEY']}")
    parsed_places = JSON.parse(second_rest_request.body)["user_reviews"]
    parsed_places.each do |review|
      ZomatoReview.create(reviewer_image: review["review"]["user"]["profile_image"],
                          reviewer_username: review["review"]["user"]["name"],
                          reviewer_profile_url: review["review"]["user"]["profile_url"],
                          review_text: review["review"]["review_text"],
                          rating: review["review"]["rating"],
                          review_time: review["review"]["timestamp"],
                          restaurant_id: relate_restaurant_id)
    end
  end

end

# rubocop:enable Metrics/LineLength