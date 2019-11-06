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

end
