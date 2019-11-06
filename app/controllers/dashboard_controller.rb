class DashboardController < ApplicationController
  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
  end

  def explore
  end
end


# the  following method will take params :city and :name, will first query a geolocation service to acquire lat/lon,
# it  will then use lat/lon and the restaurant name to acquire a restaurant id
# it will then use the restaurant id to acquire the latest 5 reviews, parse its data and create a new Zomato_Review instance
def api_zomato
  results = Geocoder.search(params[:city])
  lat = results[0].data["center"][0]
  lon = results[0].data["center"][1]
  apicall1 = RestClient.get("https://developers.zomato.com/api/v2.1/search?q=#{params[:name]}&lat=#{lat}&lon=#{lon}&apikey=103236f73284aa2cd63486000d065c3d&count=1")
  json1 = JSON.parse{apicall1.body}
  restaurant_id = json1["restaurants"][0]["restaurant"]["R"]["res_id"]
  apicall2 = RestClient.get("https://developers.zomato.com/api/v2.1/reviews?res_id=24127336&apikey=103236f73284aa2cd63486000d065c3d")
  reviews = JSON.parse(apicall2.body)["user_reviews"]
  reviews.each do  |review|
    Zomato_Review.create(review_title: review["review"]["rating_text"], review_text:review["review"]["review_text"], rating: review["review"]["rating"], review_time:review["review"]["review_time_friendly"], reviewer:review["review"]["user"]["name"], profile_image:review["review"]["user"]["profile_image"])
  end
end

# Rails generate Model Zomato_Review review_title:string review_text:string rating:integer review_time:string reviewer:string
def api_yelp
  #getting the restaurant ID
  location = 'Singapore' #replace with @restaurant.address
  restaurant_name = 'Merci Marcel' #replace with @restaurant.name
  url_for_id = "https://api.yelp.com/v3/businesses/search?term=#{restaurant_name}&location=#{location}"
  #replace YELP_KEY once in production (#{ENV['YELP_KEY']})
  serialized_restaurants = RestClient.get(url_for_id, headers =  {'Authorization': "Bearer 2MylewUK6xe2HIBTOrHcV_WWkHW5DuUX18WUZuKS_dDMBO27gklYOYlNjDNBIlbhKqcuV3NJTLdiaK9h5CQstBPnWD287DG90nryz-3PWIu-MJh17_zXhCbk8sBiXHYx" })
  restaurants = JSON.parse(serialized_restaurants)
  restaurant_id = restaurants['businesses'][0]['id']
  p restaurant_id
  #using that restaurant ID for a review API call
  url = "https://api.yelp.com/v3/businesses/#{restaurant_id}/reviews"
  serialized_reviews = RestClient.get(url, headers = {'Authorization': "Bearer 2MylewUK6xe2HIBTOrHcV_WWkHW5DuUX18WUZuKS_dDMBO27gklYOYlNjDNBIlbhKqcuV3NJTLdiaK9h5CQstBPnWD287DG90nryz-3PWIu-MJh17_zXhCbk8sBiXHYx" })
  reviews = JSON.parse(serialized_reviews)
  #iterating through the results and creating new review instances.
  reviews["reviews"].each do |key|
    new_review = Review_yelp.new('user_name': key['user']['name'], 'review_timestamp': key['time_created'], 'rating': key['rating'], 'review': key['text'], 'user_image': key['user']['image_url'], 'profile_url': key['user']['profile_url'])
    new_review.save
  end
end

def scrape_tripadvisor
  url = params[:url]
  serialized = open(url).read
  parsed = Nokogiri.parse(serialized)
  for counter  in  1..10 do
    review = TAReview.new
    review.rating_date = parsed.search('.ratingDate')[counter].attributes['title']
    review.title = parsed.search('.noQuotes')[counter].text.strip
    review.review_link = parsed.search('.ui_column.is-9 div a')[counter].attributes['href'].value
    review.reviewer = parsed.search('.memberOverlayLink > .info_text.pointer_cursor')[counter].children.first.text
    rate = parsed.search('.ui_column.is-9')[0].children.first.attributes['class'].value
    # this returns a string like "ui_bubble_rating bubble_10" / 20 / 30 / 40 / 50 depending on the star rating
    review.rating = rate[-2].to_i
    review.save
  end

end
