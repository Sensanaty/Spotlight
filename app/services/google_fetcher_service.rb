# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class GoogleFetcherService
  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place_id(spotlight_rest_id)
    formatted_name = @name.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    parsed_id = open("#{ENV['GOOGLE_BASE_URL']}#{formatted_name}&inputtype=textquery&locationbias=point:#{@latitude},#{@longitude}&fields=place_id&key=#{ENV['GOOGLE_API_KEY']}").read
    returned_place_id = JSON.parse(parsed_id)["candidates"]

    if returned_place_id.empty?
      false
    else
      google_restaurant_id = returned_place_id[0]["place_id"]
      grab_reviews(google_restaurant_id, spotlight_rest_id)
    end
  end

  def grab_reviews(google_rest_id, spotlight_rest_id)
    fields = "formatted_address,geometry,icon,name,place_id,type,website,rating,review,user_ratings_total,price_level"
    parsed_places = JSON.parse(open("#{ENV['GOOGLE_DETAILS_URL']}#{google_rest_id}&fields=#{fields}&key=#{ENV['GOOGLE_API_KEY']}").read)
    p parsed_places["result"]["reviews"]

    parsed_places["result"]["reviews"].each do |review|
      GoogleReview.create(reviewer_image: review["profile_photo_url"],
                          reviewer_username: review["author_name"],
                          reviewer_profile_url: review["author_url"],
                          review_text: review["text"],
                          rating: review["rating"],
                          review_time: review["time"],
                          restaurant_id: spotlight_rest_id)
    end
  end
end

# rubocop:enable Metrics/LineLength
