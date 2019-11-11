# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength

require 'faker'

class ReviewSeedingService
  # @restaurant = Restaurant.find_by(user_id: current_user)
  @restaurant = Restaurant.last

  def self.google_seed
    puts "\n\e[34mNow seeding randomly generated Google reviews\e[0m"
    rand(40..70).times do
      username = "#{Faker::Verb.past_participle}#{Faker::GreekPhilosophers.name}#{Faker::NatoPhoneticAlphabet.code_word}#{rand(1050)}"
      GoogleReview.create(reviewer_image: Faker::Avatar.image,
                          reviewer_username: username,
                          reviewer_profile_url: "https://sp0tlight.herokuapp.com",
                          review_text: "#{Faker::Quote.matz} #{Faker::Lorem.sentence(word_count: rand(15..25))}",
                          rating: rand(1.0..5.0),
                          review_time: rand(1_420_070_400..1_573_506_000),
                          restaurant_id: @restaurant.id)
    end
    puts "\e[92Google Seeded\e[0m\n"
  end
end

# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength
