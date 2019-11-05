require 'open-uri'
require 'json'

class GoogleFetcherService
  def initialize(name)
    @name = name
  end

  def grab_place
    formatted_name = @name.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    parsed_id = open("#{ENV['GOOGLE_BASE_URL']}#{formatted_name}&inputtype=textquery&fields=place_id&key=#{ENV['GOOGLE_API_KEY']}").read
    returned_place_id = JSON.parse(parsed_id)["candidates"][0]["place_id"]

    fields = "formatted_address,geometry,icon,name,place_id,type,website,rating,review,user_ratings_total,price_level"
    JSON.parse(open("#{ENV['GOOGLE_DETAILS_URL']}#{returned_place_id}&fields=#{fields}&key=#{ENV['GOOGLE_API_KEY']}").read)
  end
end