
require 'open-uri'
require 'json'

class FourSquareFetcherService
  def initialize(name, location)
    @name = name
    @location = location
  end

  def grab_place(relate_restaurant_id) # rubocop:disable Metrics/MethodLength
    # 1st API call
    find_id_url = "https://api.foursquare.com/v2/venues/search?query=#{@name}&client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323&near=#{@location}"
    parsed_id = open(find_id_url).read
    returned_place_id = JSON.parse(parsed_id)["response"]["venues"][0]["id"]

    find_reviews_url = "https://api.foursquare.com/v2/venues/#{returned_place_id}/tips?client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323"
    parsed_reviews = open(find_reviews_url).read
    returned_reviews = JSON.parse(parsed_id)["response"]["tips"]["items"]

    returned_reviews.each do |review|
      FourSquareReview.create(reviewer_image: "https://image.flaticon.com/icons/svg/145/145843.svg",
                              review_picture: review["photourl"],
                              reviewer_username: review["user"]["firstName"],
                              reviewer_profile_url: review["photourl"],
                              review_text: review["text"],
                              review_time: review["createdAt"])
    end
  end

# end
# class FourSquareFetcherService
#   def initialize(name, lat, long)
#     @name = name
#     @lat = lat
#     @long = long
#   end

#   def grab_place(relate_restaurant_id) # rubocop:disable Metrics/MethodLength
#     # 1st API call
#     find_id_url = "https://api.foursquare.com/v2/venues/search?query=#{@name}&client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323&ll=#{@lat},#{@long}"
#     parsed_id = open(find_id_url).read
#     returned_place_id = JSON.parse(parsed_id)["response"]["venues"][0]["id"]

#     find_reviews_url = "https://api.foursquare.com/v2/venues/#{returned_place_id}/tips?client_id=#{ENV['FOURSQUARE_API_KEY']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20180323"
#     parsed_reviews = open(find_reviews_url).read
#     returned_reviews = JSON.parse(parsed_id)["response"]["tips"]["items"]

#     returned_reviews.each do |review|
#       FourSquareReview.create(reviewer_image: "https://image.flaticon.com/icons/svg/145/145843.svg",
#                               review_picture: review["photourl"],
#                               reviewer_username: review["user"]["firstName"],
#                               reviewer_profile_url: review["photourl"],
#                               review_text: review["text"],
#                               review_time: review["createdAt"])
#     end
#   end

# end
