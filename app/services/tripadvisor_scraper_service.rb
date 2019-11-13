# rubocop:disable Metrics/LineLength

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative '../models/tripadvisor_review'

class TripadvisorScraperService

  def self.scrape_tripadvisor(url, restaurant)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto(url)
    browser.span(text: "More").click
    reviews = browser.div(id: "REVIEWS").html
    parsed_reviews = Nokogiri.parse(reviews)
    10.times do |index|
      remote_id = parsed_reviews.search('.review-container')[index].attributes['data-reviewid'].value.to_i
      ta_review = TripadvisorReview.new(review_time: parsed_reviews.search('.ratingDate')[index].attributes['title'],
                               rating: parsed_reviews.search('.ui_column.is-9')[index].children.first.attributes['class'].value[-2].to_i,
                               reviewer_username: parsed_reviews.search('.info_text.pointer_cursor > div')[index].text,
                               review_text: parsed_reviews.search('.partial_entry')[index].text,
                               reviewer_image: parsed_reviews.search('.ui_avatar > img')[index].attributes['src'],
                               remote_id: remote_id,
                               restaurant_id: restaurant.id)
      if TripadvisorReview.find_by(remote_id: remote_id)
        break
      else
        ta_review.save
      end
    end
  end


  # def acquire_all_review_urls
  #   # url here is the first page of the restaurant, which contains reviews, starting from the first ten
  #   pages = []
  #   url = params[:url]
  #   serialized = open(url).read
  #   parsed = Nokogiri.parse(serialized)

  #   6.times do |index|
  #     next unless parsed.search('.pageNumbers > a')[index].attributes['href'] != nil

  #     next_page = parsed.search('.pageNumbers > a')[index].attributes['href'].value
  #     new_url = "https://www.tripadvisor.com/#{next_page}"
  #     pages << new_url
  #   end

  #   finished = false

  #   until finished do
  #     url = pages[-1]
  #     serialized = open(url).read
  #     parsed = Nokogiri.parse(serialized)
  #     if parsed.search('.pageNumbers > a').size < 9
  #       finished = true
  #       next_page = parsed.search('.pageNumbers > a')[-3].attributes['href'].value
  #       new_url = "https://www.tripadvisor.com/#{next_page}"
  #       next_page2 = parsed.search('.pageNumbers > a')[-2].attributes['href'].value
  #       new_url2 = "https://www.tripadvisor.com/#{next_page2}"
  #       next_page3 = parsed.search('.pageNumbers > a')[-1].attributes['href'].value
  #       new_url3 = "https://www.tripadvisor.com/#{next_page3}"
  #       pages << new_url
  #       pages << new_url2
  #       pages << new_url3
  #     else
  #       next_page = parsed.search('.pageNumbers > a')[-4].attributes['href'].value
  #       new_url = "https://www.tripadvisor.com/#{next_page}"
  #       next_page2 = parsed.search('.pageNumbers > a')[-3].attributes['href'].value
  #       new_url2 = "https://www.tripadvisor.com/#{next_page2}"
  #       pages << new_url
  #       pages << new_url2
  #     end
  #   end
  # end

end

# rubocop:enable Metrics/LineLength
