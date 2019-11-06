

require 'rest-client'
require 'json'
require 'pry-byebug'



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

reviews["reviews"].each do |key|
  #new_review = Review_yelp.new('user': key['user']['name'], 'rating': key['rating'], 'review': key['text'], 'user_image': key['user']['image_url'], 'profile_url': key['user']['profile_url'])
  #new_review.save
  p "User: #{key['user']['name']}"
  p "Rating: #{key['rating']}"
  p "Review: #{key['text']}"
  p "User Image: #{key['user']['image_url']}"
  p "User profile Url: #{key['user']['profile_url']}"

end



