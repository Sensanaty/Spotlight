Restaurant.destroy_all
User.destroy_all

user_1_info = {
    first_name: "Joe",
    last_name: "Bloggs",
    email: "jb@gmail.com",
    password: 'password',
}

user_2_info = {
    first_name: "Jim",
    last_name: "Peters",
    email: "jp@gmail.com",
    password: 'password',
}

restaurant_logo_url = "http://www.pizzaeast.com/assets/logo-black.png"
restaurant_info = {
  name: "Peter Luger",
  address: "Brooklyn",
  cuisine: 'Pizza',
  price_level: 2,
  latitude: 40.7085126197085,
  longitude: -73.9638020302915,
  linked_channels: [],
  channel_links_attempted: ["Google"],
  yelp_review_count: [],
  yelp_average_rating: [],
  google_review_count: [],
  google_average_rating: [],
  foursquare_review_count: [],
  foursquare_average_rating: [],
  tripadvisor_review_count: [],
  tripadvisor_average_rating: [],
  zomato_review_count: [],
  zomato_average_rating: []
}

restaurant_2_info = {
  name: "Hard Rock Cafe",
  address: "150 Old Park Ln, Mayfair, London W1K 1QZ, UK",
  cuisine: "Western",
  price_level: "3",
  photo_cache: "",
  latitude: 51.5024518197085,
  longitude: -0.1504483302915105,
  linked_channels: [],
  channel_links_attempted: ["Google"],
  yelp_review_count: [],
  yelp_average_rating: [],
  google_review_count: [],
  google_average_rating: [],
  foursquare_review_count: [],
  foursquare_average_rating: [],
  tripadvisor_review_count: [],
  tripadvisor_average_rating: [],
  zomato_review_count: [],
  zomato_average_rating: []
 }

puts "\e[34mCreating user - Joe Bloggs, jb@gmail.com\e[0m"
new_user = User.new(user_1_info)
puts "\e[92mJoe Bloggs created!\e[0m\n\n"

puts "\e[34mCreating user - Jim Peters, jp@gmail.com\e[0m"
new_user_2 = User.new(user_2_info)
puts "\e[92mJim Peters created!\e[0m\n\n"

puts "\e[34mCreating restaurant - Peter Luger New York, assigned to Joe Bloggs\e[0m"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.user = new_user
new_restaurant.remote_photo_url = restaurant_logo_url
puts "\e[92mCreated Peter Luger New York restaurant!\e[0m\n\n"

puts "\e[34mCreating restaurant - Hard Rock Cafe London, assigned to Jim Peters\e[0m"
new_restaurant_2 = Restaurant.new(restaurant_2_info)
new_restaurant_2.user = new_user_2
puts "\e[92mCreated Hard Rock Cafe London restaurant!\e[0m\n\n"

new_user.save
new_user_2.save

puts "\n\e[34mFetching from Google for Peter Luger New York\e[0m"
google_fetch_status = GoogleFetcherService.new.grab_place_id(new_restaurant)
new_restaurant.linked_channels.push('Google') if google_fetch_status

puts "\e[92mGoogle Fetched for Peter Luger New York!\e[0m"

puts "\n\e[34mFetching from Google for Hard Rock Cafe London\e[0m"
google_fetch_status = GoogleFetcherService.new.grab_place_id(new_restaurant_2)
new_restaurant_2.linked_channels.push('Google') if google_fetch_status

puts "\e[92mGoogle Fetched for Hard Rock Cafe London!\e[0m"

puts "\n\e[34mFetching from Yelp\e[0m"
yelp_fetch_status = YelpFetcherService.new.grab_place(new_restaurant)
new_restaurant.linked_channels.push('Yelp') if yelp_fetch_status
puts "\e[92mYelp Fetched!\e[0m"

puts "\n\e[34mFetching from Zomato\e[0m"
zomato_fetch_status = ZomatoFetcherService.new.grab_place(new_restaurant)
new_restaurant.linked_channels.push('Zomato') if zomato_fetch_status
puts "\e[92mZomato Fetched!\e[0m"

puts "\n\e[34mFetching from FourSquare\e[0m"
FoursquareFetcherService.new.grab_place_id(new_restaurant)
new_restaurant.linked_channels.push('Foursquare')
puts "\e[92mFourSquare Fetched!\e[0m"

new_restaurant.save
new_restaurant_2.save

puts "\n\e[32m+=+=+=+=+=+=+=+=+=+=+=+=+=+\e[0m"
puts "\e[32m|| \e[42;97mSEEDING DATABASE DONE\e[0m \e[32m||"
puts "\e[32m+=+=+=+=+=+=+=+=+=+=+=+=+=+\e[0m\n"
