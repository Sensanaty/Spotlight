
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
    @restaurant = Restaurant.find_by(user_id: current_user)
    # @yelp_reviews = @restaurant.yelp_reviews.all.sort_by(&:rating)
    @google_reviews = @restaurant.google_reviews.all
    # @reviews_zomato = @restaurant.reviews_zomato.all

  end

  def explore
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def scrape_tripadvisor
    url = params[:url]
    serialized = open(url).read
    parsed = Nokogiri.parse(serialized)
    for counter  in  1..10 do
      review = TaReview.new
      review.rating_date = parsed.search('.ratingDate')[counter].attributes['title']
      review.title = parsed.search('.noQuotes')[counter].text.strip
      review.review_link = parsed.search('.ui_column.is-9 div a')[counter].attributes['href'].value
      review.reviewer = parsed.search('.memberOverlayLink > .info_text.pointer_cursor')[counter].children.first.text
      rate = parsed.search('.ui_column.is-9')[0].children.first.attributes['class'].value
      # this returns a string like "ui_bubble_rating bubble_10" / 20 / 30 / 40 / 50 depending on the star rating
      review.rating = rate[-2].to_i
      review.save
    end
  end

  def acquire_all_review_urls
    # url here is the first page of the restaurant, which contains reviews, starting from the first ten
    pages = []
    url = params[:url]
    serialized = open(url).read
    parsed = Nokogiri.parse(serialized)
    # this for...end acquires the first 6 urls
    for page in 0..7 do
    if parsed.search('.pageNumbers > a')[page].attributes['href'] != nil
      next_page = parsed.search('.pageNumbers > a')[page].attributes['href'].value
      new_url = "https://www.tripadvisor.com/#{next_page}"
      pages << new_url
    end
    end

    finished = false

    while finished == false do
      url = pages[-1]
      serialized = open(url).read
      parsed = Nokogiri.parse(serialized)
      if parsed.search('.pageNumbers > a').size < 9
        finished = true
        next_page = parsed.search('.pageNumbers > a')[-3].attributes['href'].value
        new_url = "https://www.tripadvisor.com/#{next_page}"
        next_page2 = parsed.search('.pageNumbers > a')[-2].attributes['href'].value
        new_url2 = "https://www.tripadvisor.com/#{next_page2}"
        next_page3 = parsed.search('.pageNumbers > a')[-1].attributes['href'].value
        new_url3 = "https://www.tripadvisor.com/#{next_page3}"
        pages << new_url
        pages << new_url2
        pages << new_url3
      else
        next_page = parsed.search('.pageNumbers > a')[-4].attributes['href'].value
        new_url = "https://www.tripadvisor.com/#{next_page}"
        next_page2 = parsed.search('.pageNumbers > a')[-3].attributes['href'].value
        new_url2 = "https://www.tripadvisor.com/#{next_page2}"
        pages << new_url
        pages << new_url2
      end
  end

end

acquire_all_review_urls
# scraperapi
