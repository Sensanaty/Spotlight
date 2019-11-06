# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'
require 'geocoder'

# class ZomatoFetcherService
#   def initialize(name, location)
#     @name = name
#     @location = location
#   end
#
#   def grab_place
#     # 1st API call
#     geocoded_city = Geocoder.search(@location)
#     long = geocoded_city[0].data["center"][1]
#     lat = geocoded_city[0].data["center"][0]
#     first_rest_request = RestClient.get("https://developers.zomato.com/api/v2.1/search?q=#{@name}&lat=#{lat}&lon=#{long}&apikey=#{ENV['ZOMATO_API_KEY']}&count=1")
#     restaurant_id = JSON.parse { first_rest_request.body }["restaurants"][0]["restaurant"]["R"]["res_id"]
#
#     # 2nd API call
#     second_rest_request = RestClient.get("https://developers.zomato.com/api/v2.1/reviews?res_id=#{restaurant_id}&apikey=#{ENV['ZOMATO_API_KEY']}")
#     JSON.parse(second_rest_request.body)["user_reviews"]
#   end
# end

# rubocop:enable Metrics/LineLength