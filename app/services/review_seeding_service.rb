# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength

require 'faker'

class ReviewSeedingService
  def self.google_seed(restaurant)
    puts "\n\e[34mNow seeding randomly generated Google reviews\e[0m"
    rand(50..110).times do
      GoogleReview.create(reviewer_image: Faker::Avatar.image,
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(15..25))}",
                          rating: rand(1.0..5.0),
                          review_time: rand(1_420_070_400..1_573_506_000),
                          restaurant_id: restaurant.id)
    end
    puts "\e[92Google Seeded\e[0m\n"
  end

  def self.yelp_seed(restaurant)
    puts "\n\e[34mNow seeding randomly generated Yelp reviews\e[0m"
    rand(50..80).times do
      YelpReview.create(reviewer_image: Faker::Avatar.image,
                        reviewer_username: Faker::Name.name,
                        reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                        review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(11..23))}",
                        rating: rand(1.0..5.0),
                        review_time: rand(1_420_070_400..1_573_506_000),
                        restaurant_id: restaurant.id)
    end
    puts "\e[92Yelp Seeded\e[0m\n"
  end

  def self.zomato_seed(restaurant)
    puts "\n\e[34mNow seeding randomly generated Zomato reviews\e[0m"
    rand(30..60).times do
      ZomatoReview.create(reviewer_image: Faker::Avatar.image,
                          reviewer_username: Faker::Name.name,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(17..27))}",
                          rating: rand(1.0..5.0),
                          review_time: rand(1_420_070_400..1_573_506_000),
                          restaurant_id: restaurant.id)
    end
    puts "\e[92Zomato Seeded\e[0m\n"
  end

  def self.foursquare_seed(restaurant)
    puts "\n\e[34mNow seeding randomly generated SquareSpace reviews\e[0m"
    rand(20..90).times do
      FoursquareReview.create(reviewer_image: Faker::Avatar.image,
                              reviewer_username: Faker::Name.name,
                              reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                              review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(10..19))}",
                              rating: rand(1.0..5.0),
                              review_time: rand(1_420_070_400..1_573_506_000),
                              restaurant_id: restaurant.id)
    end
    puts "\e[92Squarespace Seeded\e[0m\n"
  end
end

# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength
