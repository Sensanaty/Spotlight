# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength

require 'open-uri'
require 'json'

class GoogleFetcherService
  def grab_place_id(restaurant)
    formatted_name = restaurant.name.strip.gsub(/\s/, "%20") # All whitespace must be converted into %20 for the API to respond
    parsed_id = URI.open("#{ENV['GOOGLE_BASE_URL']}#{formatted_name}&inputtype=textquery&locationbias=point:#{restaurant.longitude},#{restaurant.latitude}&fields=place_id&key=#{ENV['GOOGLE_API_KEY']}").read
    returned_place_id = JSON.parse(parsed_id)["candidates"]

    if returned_place_id.empty?
      false
    else
      restaurant.google_id = returned_place_id[0]["place_id"]
      restaurant.save
      ReviewSeedingService.google_seed(restaurant)
      grab_reviews(restaurant)
      true
    end
  end

  def grab_reviews(restaurant)
    fields = "formatted_address,geometry,icon,name,place_id,type,website,rating,review,user_ratings_total,price_level"
    parsed_places = JSON.parse(URI.open("#{ENV['GOOGLE_DETAILS_URL']}#{restaurant.google_id}&fields=#{fields}&key=#{ENV['GOOGLE_API_KEY']}").read)

    parsed_places["result"]["reviews"].each do |review|
      GoogleReview.create(reviewer_image: review["profile_photo_url"],
                          reviewer_username: review["author_name"],
                          reviewer_profile_url: review["author_url"],
                          review_text: review["text"],
                          rating: review["rating"],
                          review_time: DateTime.strptime(review["time"].to_s, "%s"),
                          restaurant_id: restaurant.id)
    end
  end
end

# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength
