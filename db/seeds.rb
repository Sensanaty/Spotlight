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
  name: "Merci Marcel",
  address: "56 Eng Hoon St, #01-68, Singapore 160056",
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
YelpFetcherService.new(new_restaurant.name, new_restaurant.address).grab_place(new_restaurant.id)