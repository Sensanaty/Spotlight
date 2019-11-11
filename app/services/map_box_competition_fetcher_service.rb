# rubocop:disable Metrics/LineLength

require 'open-uri'
require 'json'

class MapBoxCompetitionFetcherService
  def initialize(cuisine, latitude, longitude)
    @cuisine = cuisine
    @latitude = latitude
    @longitude = longitude
  end

  def grab_place # rubocop:disable Metrics/MethodLength
    # 1st API call
    formatted_cuisine = @cuisine.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    url = "#{ENV['GOOGLE_BASE_URL_COMPETITION']}location=#{@latitude},#{@longitude}&radius=2000&type=restaurant&keyword=#{@cuisine} restaurant&key=#{ENV['GOOGLE_API_KEY']}"
    parsed_id = open(url).read
    puts url
    competition = JSON.parse(parsed_id)

    markers = competition["results"].map do |result|
      {name: result['name'], lat: result['geometry']['location']['lat'], lng: result['geometry']['location']['lng'], rating: result['rating']}
    end

    return markers.first(10)


  end
end

# rubocop:enable Metrics/LineLength



















