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
    url = "#{ENV['GOOGLE_BASE_URL_COMPETITION']}location=#{@latitude},#{@longitude}&radius=1000&type=restaurant&keyword=#{@cuisine} restaurant&key=#{ENV['GOOGLE_API_KEY']}"
    parsed_id = open(url).read
    competition = JSON.parse(parsed_id)

    markers = competition["results"].map do |result|
      image = "https://i.ibb.co/MNRnsLF/Screenshot-2019-11-15-at-10-13-43.png"
      if result["photos"]
        photo_reference = result['photos'][0]['photo_reference']
        image = "#{ENV['GOOGLE_IMAGE_URL']}maxwidth=200&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
      end
      {name: result['name'], lat: result['geometry']['location']['lat'], lng: result['geometry']['location']['lng'], cuisine: @cuisine, rating: result['rating'], price_level: result['price_level'], user_ratings_total: result['user_ratings_total'], photo: image }

    end
    sorted_markers = markers.sort_by { |k| k[:rating] }.reverse
    return sorted_markers.first(10)


  end

end

# rubocop:enable Metrics/LineLength

