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
  end

  def self.foursquare_seed(restaurant)
    rand(100..120).times do
      FoursquareReview.create(reviewer_image: "https://i.pravatar.cc/150?u=abasdad#{rand(0..1_000_000)}.jpg",
                              reviewer_username: Faker::Name.name,
                              review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(10..19))}",
                              review_time: DateTime.strptime(date_picker.to_s, "%s"),
                              restaurant_id: restaurant.id)
    end
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
end

# rubocop:enable Metrics/MethodLength
