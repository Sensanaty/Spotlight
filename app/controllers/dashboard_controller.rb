# class DashboardController < ApplicationController
#   def home
#   end

#   def feed
#   end

#   def explore
#   end
# end


# geocoder, feed in params from city, spits our coordinates,
# add coordinates to API request

def api_zomato
  results = Geocoder.search(params[:city])
  lat = results[0].data["center"][0]
  lon = results[0].data["center"][1]
  apicall1 = RestClient.get("https://developers.zomato.com/api/v2.1/search?q=#{params[:name]}&lat=#{lat}&lon=#{lon}&apikey=103236f73284aa2cd63486000d065c3d&count=1")
  json1 = JSON.parse{apicall1.body}
  restaurant_id = json1["restaurants"][0]["restaurant"]["R"]["res_id"]
  apicall2 = RestClient.get("https://developers.zomato.com/api/v2.1/reviews?res_id=24127336&apikey=103236f73284aa2cd63486000d065c3d")
  reviews = JSON.parse(results)["user_reviews"]
  reviews.each do  |review|
    Zomato_Review.create(review_title:"", review_text:"", rating:5, review_time:"", reviewer:"")
  end
end

# Rails generate Model Zomato_Review review_title:string review_text:string rating:integer review_time:string reviewer:string
