# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_info = {
  first_name: "Joe",
  last_name: "Bloggs",
  email: "jb@gmail.com",
  password: 'password',
}

restaurant_logo_url = "http://www.pizzaeast.com/assets/logo-black.png"
restaurant_info = {
  name: "Pizza East",
  address: "310 Portobello Rd, London W10 5TA, United Kingdom",
  cuisine: 'Pizza',
  price_level: 2,
  user_id: 1
}

puts "Creating user - Joe Bloggs, jb@gmail.com"
new_user = User.new(user_info)

puts "Creating restaurant - Pizza East, assigned to Joe Bloggs"
new_restaurant = Restaurant.new(restaurant_info)
new_restaurant.remote_photo_url = restaurant_logo_url

# new_user.save!
new_restaurant.save!
