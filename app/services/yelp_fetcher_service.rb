# rubocop:disable Lint/UselessAssignment
require 'open-uri'
require 'json'

class YelpFetcherService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place(relate_restaurant_id) # rubocop:disable Metrics/MethodLength
    # 1st API call
    id_uri = "https://api.yelp.com/v3/businesses/search?latitude=#{@latitude}&longitude=#{@longitude}"
    serialized_restaurants = RestClient.get(id_uri, headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
    restaurant_id = JSON.parse(serialized_restaurants)['businesses'][0]['id']

    # 2nd API call
    review_uri = "https://api.yelp.com/v3/businesses/#{restaurant_id}/reviews"
    serialized_reviews = RestClient.get(review_uri, headers = { 'Authorization': "Bearer #{ENV['YELP_API_KEY']}" })
    parsed_places = JSON.parse(serialized_reviews)

    # p parsed_places
    parsed_places["reviews"].each do |review|
      YelpReview.create(reviewer_image: review["user"]["image_url"],
                        reviewer_username: review["user"]["name"],
                        reviewer_profile_url: review["user"]["profile_url"],
                        review_text: review["text"],
                        rating: review["rating"],
                        review_time: DateTime.parse(review["time_created"]).to_i, # Convert to UNIX time for better storage
                        restaurant_id: relate_restaurant_id)
    end
  end

end

# rubocop:enable Lint/UselessAssignment
