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

puts "Creating user - Joe Bloggs, jb@gmail.com"
new_user = User.new(user_info)

puts "Creating restaurant - Pizza East, assigned to Joe Bloggs"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.user = new_user
new_restaurant.remote_photo_url = restaurant_logo_url

new_user.save
new_restaurant.save
GoogleFetcherService.new(new_restaurant.name).grab_place(new_restaurant.id)
