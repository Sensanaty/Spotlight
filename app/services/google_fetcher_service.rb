# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class GoogleFetcherService
  def initialize(name)
    @name = name
  end

  def grab_place(id) # rubocop:disable Metrics/MethodLength
    # 1st API call
    formatted_name = @name.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    parsed_id = open("#{ENV['GOOGLE_BASE_URL']}#{formatted_name}&inputtype=textquery&fields=place_id&key=#{ENV['GOOGLE_API_KEY']}").read
    returned_place_id = JSON.parse(parsed_id)["candidates"][0]["place_id"]

    # 2nd API call
    fields = "formatted_address,geometry,icon,name,place_id,type,website,rating,review,user_ratings_total,price_level"
    parsed_places = JSON.parse(open("#{ENV['GOOGLE_DETAILS_URL']}#{returned_place_id}&fields=#{fields}&key=#{ENV['GOOGLE_API_KEY']}").read)

    GoogleReview.create(formatted_address: parsed_places["result"]["formatted_address"],
                        latitude: parsed_places["result"]["geometry"]["location"]["lat"],
                        longitude: parsed_places["result"]["geometry"]["location"]["lng"],
                        name: parsed_places["result"]["name"],
                        rating: parsed_places["result"]["rating"],
                        reviews: parsed_places["result"]["reviews"],
                        types: parsed_places["result"]["types"],
                        user_ratings_total: parsed_places["result"]["user_ratings_total"],
                        restaurant_id: id)
  end
end

# rubocop:enable Metrics/LineLength