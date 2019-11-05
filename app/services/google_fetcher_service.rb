require 'open-uri'
require 'json'

class GoogleFetcherService
  def initialize(name)
    @name = name
  end

  def grab_place_id
    formatted_name = @name.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    fields = "place_id" # ,name,geometry,formatted_address,rating,user_ratings_total"
    parsed_id = open("#{ENV['GOOGLE_BASE_URL']}#{formatted_name}&inputtype=textquery&fields=#{fields}&key=#{ENV['GOOGLE_API_KEY']}").read
    JSON.parse(parsed_id)
  end

  def place_details
    place_id = grab_place_id
    fields = ""
    parsed_details = open("#{ENV[GOOGLE_DETAILS_URL]}#{place_id}&fields=#{fields}")
    https://maps.googleapis.com/maps/api/place/details/json?place_id=
  end
end