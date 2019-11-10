Restaurant.destroy_all
User.destroy_all

user_info = {
    first_name: "Joe",
    last_name: "Bloggs",
    email: "jb@gmail.com",
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
  linked_channels: = [],
}

puts "\e[34mCreating user - Joe Bloggs, jb@gmail.com\e[0m"
new_user = User.new(user_info)
puts "\e[92mJoe Bloggs created!\e[0m\n\n"

puts "\e[34mCreating restaurant - Peter Luger New York, assigned to Joe Bloggs\e[0m"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.user = new_user
new_restaurant.remote_photo_url = restaurant_logo_url
puts "\e[92mCreated restaurant!\e[0m\n\n"

new_user.save
new_restaurant.save

puts "\n\e[34mFetching from Google\e[0m"
google_fetch? = GoogleFetcherService.new(new_restaurant.name).grab_place(new_restaurant.id)
new_restaurant.linked_channels.push('Google') if google_fetch?
puts "\e[92mGoogle Fetched!\e[0m"

puts "\n\e[34mFetching from Yelp\e[0m"
YelpFetcherService.new(new_restaurant.latitude, new_restaurant.longitude).grab_place(new_restaurant.id)
new_restaurant.linked_channels.push('Yelp')
puts "\e[92mYelp Fetched!\e[0m"

puts "\n\e[34mFetching from Zomato\e[0m"
ZomatoFetcherService.new(new_restaurant.name, new_restaurant.latitude, new_restaurant.longitude).grab_place(new_restaurant.id)
new_restaurant.linked_channels.push('Zomato')
puts "\e[92mZomato Fetched!\e[0m"

puts "\n\e[34mFetching from FourSquare\e[0m"
FoursquareFetcherService.new(new_restaurant.name, new_restaurant.latitude, new_restaurant.longitude).grab_place(new_restaurant.id)
new_restaurant.linked_channels.push('Foursquare')
puts "\e[92mFourSquare Fetched!\e[0m"

puts "\n\e[32m+=+=+=+=+=+=+=+=+=+=+=+=+=+\e[0m"
puts "\e[32m|| \e[42;97mSEEDING DATABASE DONE\e[0m \e[32m||"
puts "\e[32m+=+=+=+=+=+=+=+=+=+=+=+=+=+\e[0m\n"
