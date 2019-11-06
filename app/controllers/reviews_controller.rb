require 'pry-byebug'
class ReviewsController < ApplicationController
  def initialize(name, location)
    @name = name
    @location = location
  end

  def create_google
    # @google_reviews = GoogleFetcherService.new(@name).grab_place
  end

  def create_zomato
    @zomato_reviews = ZomatoFetcherService.new(@name, @location)
    @zomato_created = @zomato_reviews.each do |key|
      ZomatoReview.create(review_title: key["key"]["rating_text"],
                          review_text: key["key"]["review_text"],
                          rating: key["key"]["rating"],
                          review_time: key["key"]["review_time_friendly"],
                          reviewer: key["key"]["user"]["name"],
                          profile_image: key["key"]["user"]["profile_image"])
    end
  end

  def create_yelp
    @yelp_reviews = YelpFetcherService.new(@name, @location).grab_place
    @yelp_created = @yelp_reviews["reviews"].each do |key|
      YelpReview.create('user_name': key['user']['name'],
                        'review_timestamp': key['time_created'],
                        'rating': key['rating'],
                        'review': key['text'],
                        'user_image': key['user']['image_url'],
                        'profile_url': key['user']['profile_url'])
    end
  end

end
