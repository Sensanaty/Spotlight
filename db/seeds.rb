# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
  name: "Square One",
  address: "Danau Tamblingan No.51, Sanur, Kec. Denpasar Sel., Kota Denpasar, Bali 80228",
  cuisine: 'Pizza',
  price_level: 2
}

yelp_review_info = {
  user_name: "Johannes",
  review_timestamp: "19-03-1987",
  rating: 4,
  review: "We've been there yesterday. Nice cocktails (mojito) and
  very kind waiters. We didn't have luck with the bill though. Sign at
  the entry says 2 for 1 including cocktails. At the end we were told
  this is not applicable for mojitos...don't get me wrong, still
  reasonable prices but we left with a bad gut feeling. Would go there
  again, but would make sure to ask for prices right from the start.",
  user_image:
  "https://i.pinimg.com/236x/93/ec/45/93ec4564a02cbbc3b64aad49dbb183f6.jpg",
  #profile_url: "https://www.google.com"
}

puts "Creating user - Joe Bloggs, jb@gmail.com"
new_user = User.new(user_info)

puts "Creating restaurant - Pizza East, assigned to Joe Bloggs"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.user = new_user
new_restaurant.remote_photo_url = restaurant_logo_url

puts "Creating yelp_reviews"
3.times do
  new_yelp_rating = YelpReview.new(yelp_review_info)
  new_yelp_rating.restaurant = new_restaurant
  new_yelp_rating.save
end

new_user.save
new_restaurant.save
GoogleFetcherService.new(new_restaurant.name).grab_place(new_restaurant.id)
