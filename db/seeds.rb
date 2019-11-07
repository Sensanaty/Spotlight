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

puts "Creating user - Joe Bloggs, jb@gmail.com"
new_user = User.new(user_info)
puts "Joe Bloggs created!\n\n"

puts "Creating restaurant - Carmines Italian New York, assigned to Joe Bloggs"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.user = new_user
new_restaurant.remote_photo_url = restaurant_logo_url
puts "Created restaurant!\n\n"

new_user.save
new_restaurant.save

puts "\nFetching from Google"
GoogleFetcherService.new(new_restaurant.name).grab_place(new_restaurant.id)
puts "Google Fetched!"

puts GoogleReview.last.restaurant_review.review_time

puts "\nFetching from Yelp"
YelpFetcherService.new(new_restaurant.name, new_restaurant.address).grab_place(new_restaurant.id)
puts "Yelp Fetched!"

puts YelpReview.last.restaurant_review.review_time


puts "\nFetching from Zomato"
ZomatoFetcherService.new(new_restaurant.name, new_restaurant.address).grab_place(new_restaurant.id)
puts "Zomato Fetched!"

puts "\n+=+=+=+=+=+=+=+=+=+=+=+=+=+"
puts "|| SEEDING DATABASE DONE ||"
puts "+=+=+=+=+=+=+=+=+=+=+=+=+=+\n"
