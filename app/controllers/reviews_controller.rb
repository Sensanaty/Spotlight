require 'pry-byebug'
class ReviewsController < ApplicationController
  def initialize(name, location)
    @name = name
    @location = location
  end

  def new_google
    # @google_reviews = GoogleFetcherService.new(@name).grab_place
  end

  def create_google
  end

  def create_zomato
  end

  def create_yelp
    @yelp_reviews = YelpFetcherService.new(@name, @location).grab_place
    @created = @yelp_reviews["reviews"].each do |key|
      YelpReview.create('user_name': key['user']['name'],
                        'review_timestamp': key['time_created'],
                        'rating': key['rating'],
                        'review': key['text'],
                        'user_image': key['user']['image_url'],
                        'profile_url': key['user']['profile_url'])
    end
  end
end
