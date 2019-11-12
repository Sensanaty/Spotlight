# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength

require 'open-uri'
require 'json'

class FoursquareFetcherService
  def grab_place_id(restaurant)
    fetched_id = URI.open("https://api.foursquare.com/v2/venues/search?query=#{restaurant.name}&client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323&ll=#{restaurant.latitude},#{restaurant.longitude}").read
    parsed_id = JSON.parse(fetched_id)["response"]["venues"]

    if parsed_id.empty?
      false # returns false if the restaurant isn't found on FourSquare
    else
      restaurant.foursquare_id = parsed_id[0]["id"]
      restaurant.save
      ReviewSeedingService.foursquare_seed(restaurant)
      grab_reviews(restaurant)
      true
    end
  end

  def grab_reviews(restaurant)
    parsed_reviews = URI.open("https://api.foursquare.com/v2/venues/#{restaurant.foursquare_id}/tips?client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323").read
    returned_reviews = JSON.parse(parsed_reviews)["response"]["tips"]["items"]

    returned_reviews.each do |review|
      FoursquareReview.create(reviewer_image: "https://image.flaticon.com/icons/svg/145/145843.svg",
                              meal_image: review["photourl"],
                              reviewer_username: review["user"]["firstName"],
                              review_text: review["text"],
                              review_time: DateTime.strptime(review["createdAt"].to_s, "%s"),
                              restaurant_id: restaurant.id)
    end
  end
end

# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength
