# rubocop:disable Lint/UselessAssignment
require 'open-uri'
require 'json'

class YelpFetcherService
  def initialize(name, location)
    @name = name
    @location = location
  end

  def grab_place
  # 1st API call
  id_uri = "https://api.yelp.com/v3/businesses/search?term=#{@name}&location=#{@location}"
  serialized_restaurants = RestClient.get(id_uri, headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
  restaurant_id = JSON.parse(serialized_restaurants)['businesses'][0]['id']
  
  # 2nd API call
  review_uri = "https://api.yelp.com/v3/businesses/#{restaurant_id}/reviews"
  serialized_reviews = RestClient.get(review_uri, headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
  JSON.parse(serialized_reviews)
  end
end

# rubocop:enable Lint/UselessAssignment