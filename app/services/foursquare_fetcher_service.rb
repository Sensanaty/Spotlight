# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class FoursquareFetcherService
  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place(relate_restaurant_id) # rubocop:disable Metrics/MethodLength
    # 1st API call
    find_id_url = "https://api.foursquare.com/v2/venues/search?query=#{@name}&client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323&ll=#{@latitude},#{@longitude}"
    parsed_id = open(find_id_url).read
    returned_place_id = JSON.parse(parsed_id)["response"]["venues"][0]["id"]

    find_reviews_url = "https://api.foursquare.com/v2/venues/#{returned_place_id}/tips?client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323"
    parsed_reviews = open(find_reviews_url).read
    returned_reviews = JSON.parse(parsed_reviews)["response"]["tips"]["items"]

    returned_reviews.each do |review|
      FoursquareReview.create(reviewer_image: "https://image.flaticon.com/icons/svg/145/145843.svg",
                              meal_image: review["photourl"],
                              reviewer_username: review["user"]["firstName"],
                              review_text: review["text"],
                              review_time: review["createdAt"],
                              restaurant_id: relate_restaurant_id)
    end
  end

end

# rubocop:enable Metrics/LineLength
