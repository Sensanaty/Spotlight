# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class GoogleFetcherService
  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place(relate_restaurant_id) # rubocop:disable Metrics/MethodLength
    # 1st API call
    formatted_name = @name.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    parsed_id = open("#{ENV['GOOGLE_BASE_URL']}#{formatted_name}&inputtype=textquery&locationbias=point:#{@latitude},#{@longitude}&fields=place_id&key=#{ENV['GOOGLE_API_KEY']}").read
    returned_place_id = JSON.parse(parsed_id)["candidates"][0]["place_id"]

    # 2nd API call
    fields = "formatted_address,geometry,icon,name,place_id,type,website,rating,review,user_ratings_total,price_level"
    parsed_places = JSON.parse(open("#{ENV['GOOGLE_DETAILS_URL']}#{returned_place_id}&fields=#{fields}&key=#{ENV['GOOGLE_API_KEY']}").read)

    parsed_places["result"]["reviews"].each do |review|
      GoogleReview.create(reviewer_image: review["profile_photo_url"],
                          reviewer_username: review["author_name"],
                          reviewer_profile_url: review["author_url"],
                          review_text: review["text"],
                          rating: review["rating"],
                          review_time: review["time"],
                          restaurant_id: relate_restaurant_id)
    end
  end

end

# rubocop:enable Metrics/LineLength