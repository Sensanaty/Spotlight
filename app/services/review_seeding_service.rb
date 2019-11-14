# rubocop:disable Metrics/MethodLength

require 'faker'

class ReviewSeedingService
  NUMBERS = []
  70.times do
    NUMBERS << 5
  end

  60.times do
    NUMBERS << 4
  end

  20.times do
    NUMBERS << 3
  end

  10.times do
    NUMBERS << 2
  end

  5.times do
    NUMBERS << 1
  end

  def self.google_seed(restaurant)
    rand(100..120).times do
      GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(15..25))}",
                          rating: NUMBERS.sample,
                          review_time: DateTime.strptime(date_picker.to_s, "%s"),
                          restaurant_id: restaurant.id)
    end
    real_google_reviews(restaurant)
  end

  def self.yelp_seed(restaurant)
    rand(100..120).times do
      YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(11..23))}",
                        rating: NUMBERS.sample,
                        review_time: DateTime.strptime(date_picker.to_s, "%s"),
                        restaurant_id: restaurant.id)
    end
    real_yelp_reviews(restaurant)
  end

  def self.zomato_seed(restaurant)
    rand(100..120).times do
      ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(17..27))}",
                          rating: NUMBERS.sample,
                          review_time: DateTime.strptime(date_picker.to_s, "%s"),
                          restaurant_id: restaurant.id)
    end
    real_zomato_reviews(restaurant)
  end

  def self.foursquare_seed(restaurant)
    rand(100..120).times do
      FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(10..19))}",
                              review_time: DateTime.strptime(date_picker.to_s, "%s"),
                              restaurant_id: restaurant.id)
    end
    real_foursquare_reviews(restaurant)
  end

  def self.date_picker

    month = rand(1..7)
    case month
    when 1
      rand(1_554_076_800..1_556_582_400)
    when 2
      rand(1_556_668_800..1_559_347_199)
    when 3
      rand(1_559_347_200..1_561_939_199)
    when 4
      rand(1_561_939_200..1_564_617_599)
    when 5
      rand(1_564_617_600..1_567_295_999)
    when 6
      rand(1_567_296_000..1_569_887_999)
    else
      rand(1_569_888_000..1_572_566_399)
    end
  end


  def self.real_google_reviews(restaurant)

    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Great food. Super friendly people.",
                          rating: 5,
                          review_time:DateTime.strptime(DateTime.parse("01/11/2019 10:43:15").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Consistently good food quality. We got the French toast and the pumpkin salad. Portions are generous and the food’s really fresh. Coffee is good too. It gets really crowded during weekend brunch hours but you don’t have to wait too long for a table, and service is as efficient as it gets.",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("02/11/2019 20:46:42").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "The ambience was relaxing and there was sufficient space for everyone. Service was impeccable and speedy. I would recommend anyone in the area to go for the brunch menu here. Enjoy yourself guys!",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("03/11/2019 08:47:51").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Loved lunch here today... beautifully designed cafe with creative healthy delicious food. Anyone can find something to love on the menu. Highly recommend the Caesar Salad...sounds boring but it's not! Great smoothie bowl and other treats too.",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("04/11/2019 20:51:18").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Delicious! Tuna bowl is great and pulled beef burger is fascinating. I’ll be back 100%",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("05/11/2019 20:53:36").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Ostensibly friendly but useless staff. Bartender should be fired for incompetence and ineptitude immediately",
                          rating: 2,
                          review_time: DateTime.strptime(DateTime.parse("06/11/2019 20:55:54").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Loved the atmosphere and super friendly staff. Food was good not great.",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("08/11/2019 21:00:30").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Good vibes. Nice staff, quite place and really best for healty food 😀",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("09/11/2019 09:01:39").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "I loved the breakfast we had here. The delux vegan roll was amazing, if not one of the best vegan “burgers” I’ve ever had. The purple vegan pancakes were really good as well. There are a few small things that made me rate the mocca 4/5 stars: the portion of the pancakes was pretty tiny unfortunately. It was definitely not filling. Also it’s sometimes really difficult to get the staff’s attention if you want to order or pay. The music is not really my taste either but other than that: nice place with great food!",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("12/11/2019 21:05:06").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    GoogleReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "The coffee is great here! Clean toilet. Kind staff",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("13/11/2019 21:12:00").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    end

  def self.real_yelp_reviews(restaurant)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "The food was amazing and loved the drinks.  Had the fluke crudo which was super fresh, well balanced, and almost got another order. And the rice over chicken was probably one of the best I have had. The chicken is perfection with just the right about of seasoning and beautifully cooked -  so juicy and moist.",
                        rating: 5,
                        review_time: DateTime.strptime(DateTime.parse("01/11/2019 10:43:15").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "The service was great all around. The salads are amazing. Super filling and healthy",
                        rating: 4,
                        review_time: DateTime.strptime(DateTime.parse("02/11/2019 20:46:42").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "The food, ambiance, service and execution was on point. We tried the gulf shrimp (favorite), chicken wings, and fried green tomatoes. Definitely grab a table in the patio around this time of year -  you won't regret it.",
                        rating: 5,
                        review_time: DateTime.strptime(DateTime.parse("03/11/2019 08:47:51").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "Really wish I would've found out about this place earlier in the summer because the garden is perfect! ",
                        rating: 4,
                        review_time: DateTime.strptime(DateTime.parse("04/11/2019 20:51:18").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "My friend and I came across this restaurant via yelp - and it didn't disappoint! Food was delicious and perfectly executed.",
                        rating: 5,
                        review_time: DateTime.strptime(DateTime.parse("05/11/2019 20:53:36").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "Found not one but two hairs in my food! Bah! Resolved it by giving my money back.",
                        rating: 1,
                        review_time: DateTime.strptime(DateTime.parse("09/11/2019 09:01:39").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "Affordable, delicious & beautiful ambiance! Try to make it before the backyard closes. Really feels like you've transported to the Mediterranean. Theres two large wooden tables, perfect for large parties! As well as smaller intimate tables perfect for dates. And if your dining solo you can always situate yourself at the bar inside.  ",
                        rating: 4,
                        review_time: DateTime.strptime(DateTime.parse("12/11/2019 21:05:06").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "Affordable, delicious & beautiful ambiance!",
                        rating: 5,
                        review_time: DateTime.strptime(DateTime.parse("13/11/2019 21:12:00").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
    YelpReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "The aircon was put rediculously cold. The staff mentioned they changed the temperature which I don't believe. Ruined the night",
                        rating: 1,
                        review_time: DateTime.strptime(DateTime.parse("14/11/2019 22:12:00").to_i.to_s, "%s"),
                        restaurant_id: restaurant.id)
  end

  def self.real_zomato_reviews(restaurant)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Food, service, atmosphere were good, the place was just really cold! Don't forget to take your sweather. ",
                          rating: 2,
                          review_time: DateTime.strptime(DateTime.parse("01/11/2019 10:43:15").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Nice place, friendly staff",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("01/11/2019 14:43:15").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "The bar and tables are a little unergonomic (too high and too low), but rest is great.",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("02/11/2019 08:40:45").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "The salmon sandwich was super nice. Loved the smoothies too!",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("05/11/2019 20:51:12").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Great place for quick brunch",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("09/11/2019 09:01:39").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Staff was painfully slow",
                          rating: 2,
                          review_time: DateTime.strptime(DateTime.parse("12/11/2019 21:12:06").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "I've only come here for lunch on a Saturday, so this review has yet to be updated! After my one visit, I fell in loveeee with this restaurant.",
                          rating: 5,
                          review_time: DateTime.strptime(DateTime.parse("14/11/2019 09:22:33").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
    ZomatoReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "Great food great atmosphere",
                          rating: 4,
                          review_time: DateTime.strptime(DateTime.parse("14/11/2019 21:33:00").to_i.to_s, "%s"),
                          restaurant_id: restaurant.id)
  end

  def self.real_foursquare_reviews(restaurant)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Loved the avocado on toast!",
                              review_time: DateTime.strptime(DateTime.parse("04/11/2019 10:43:15").to_i.to_s, "%s"),
                              meal_image: "https://restaurantden.com/wp-content/uploads/2017/09/pexels.jpg",
                              restaurant_id: restaurant.id)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Loved the avocado on toast!",
                              review_time: DateTime.strptime(DateTime.parse("07/11/2019 11:10:03").to_i.to_s, "%s"),
                              meal_image: "https://restaurantden.com/wp-content/uploads/2017/09/burst.jpg",
                              restaurant_id: restaurant.id)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Not everyone who roasts on a Probat and pulls shots on a Synesso knows what he’s doing. These guys do - great coffee all around. Natural Kintamani V60 was nice as well.",
                              review_time: DateTime.strptime(DateTime.parse("02/11/2019 08:40:45").to_i.to_s, "%s"),
                              meal_image: "https://fastly.4sqi.net/img/general/width960/463836802_KHsWyY_B9UCsinBPTnd7e4Yr9ZHVtvT03uqKBCUV52Y.jpg",
                              restaurant_id: restaurant.id)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Great burger!",
                              review_time: DateTime.strptime(DateTime.parse("05/11/2019 20:51:12").to_i.to_s, "%s"),
                              meal_image: "https://restaurantden.com/wp-content/uploads/2017/09/stocksnap.jpg",
                              restaurant_id: restaurant.id)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Definitely one of the best café with the best coffee in town. I’m a piccolo drinker and it’s one of the bests I’ve had. Their breakfast is also good and very affordable. Highly recommended",
                              review_time: DateTime.strptime(DateTime.parse("05/11/2019 20:58:14").to_i.to_s, "%s"),
                              restaurant_id: restaurant.id)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Tasty. Mix of 3 salads is great idea - the bowl is really big, while it is same price as if you take one salad. Tasty kombucha and iced latte. Olives from starter menu are delicious.",
                              review_time: DateTime.strptime(DateTime.parse("06/11/2019 21:05:16").to_i.to_s, "%s"),
                              meal_image: "https://fastly.4sqi.net/img/general/width960/386548362_4svk6B7RdSgZjFXDvZVhJPV3-2KKmrVXKZGyVnWQrDE.jpg",
                              restaurant_id: restaurant.id)
    FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "Thoroughly satisfied. Had steak baguette and pancakes. I'm a happy boy, now",
                              review_time: DateTime.strptime(DateTime.parse("08/11/2019 20:51:12").to_i.to_s, "%s"),
                              meal_image: "https://fastly.4sqi.net/img/general/width960/429547292_QYmAJ4BWazo4uP6yR0K007MdKbPSLgyy3ENJDH9Njoo.jpg",
                              restaurant_id: restaurant.id)
  end

end

# rubocop:enable Metrics/MethodLength
