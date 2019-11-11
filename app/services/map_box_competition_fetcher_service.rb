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
    parsed_id = open("#{ENV['GOOGLE_BASE_URL_COMPETITION']}query=#{@cuisine} restaurant&location=#{@longitude},#{@latitude}&radius=5000&key=#{ENV['GOOGLE_API_KEY']}").read
    competition = JSON.parse(parsed_id)

    markers = competition["results"].map do |result|
      {name: result['name'], lat: result['geometry']['location']['lat'], lng: result['geometry']['location']['lng'], rating: result['rating']}
    end

    return markers


    # 2nd API call

    # parsed_places["result"]["reviews"].each do |review|
    #   GoogleReview.create(reviewer_image: review["profile_photo_url"],
    #                       reviewer_username: review["author_name"],
    #                       reviewer_profile_url: review["author_url"],
    #                       review_text: review["text"],
    #                       rating: review["rating"],
    #                       review_time: review["time"],
    #                       restaurant_id: relate_restaurant_id)
    # end
  end
end

# rubocop:enable Metrics/LineLength
