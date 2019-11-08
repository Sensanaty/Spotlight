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
  name: "Carmines Italian New York",
  address: "New York",
  cuisine: 'Pizza',
  price_level: 2
}

puts "\e[34mCreating user - Joe Bloggs, jb@gmail.com"
new_user = User.new(user_info)
puts "\e[92mJoe Bloggs created!\n\n"

puts "\e[34mCreating restaurant - Carmines Italian New York, assigned to Joe Bloggs"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.user = new_user
new_restaurant.remote_photo_url = restaurant_logo_url
puts "\e[92mCreated restaurant!\n\n"

new_user.save
new_restaurant.save

puts "\n\e[34mFetching from Google"
GoogleFetcherService.new(new_restaurant.name).grab_place(new_restaurant.id)
puts "\e[92mGoogle Fetched!"

puts "\n\e[34mFetching from Yelp"
YelpFetcherService.new(new_restaurant.name, new_restaurant.address).grab_place(new_restaurant.id)
puts "\e[92mYelp Fetched!"

puts "\n\e[34mFetching from Zomato"
ZomatoFetcherService.new(new_restaurant.name, new_restaurant.address).grab_place(new_restaurant.id)
puts "\e[92mZomato Fetched!"

puts "\n\e[32m+=+=+=+=+=+=+=+=+=+=+=+=+=+\e[0m"
puts "\e[32m|| \e[42;97mSEEDING DATABASE DONE\e[0m \e[32m||"
puts "\e[32m+=+=+=+=+=+=+=+=+=+=+=+=+=+\e[0m\n"
