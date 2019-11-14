# rubocop:disable Metrics/LineLength

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative '../models/tripadvisor_review'

class TripadvisorScraperService
  def self.first_scrape(restaurant)
    TripadvisorScraperService.acquire_all_review_urls(restaurant).each do |url|
      scrape_tripadvisor(url, restaurant)
    end
  end

  def self.update_scraped
    scrape_tripadvisor(url, restaurant)
  end

  def self.scrape_tripadvisor(url, restaurant)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto(url)
    attempts = 0
    begin
      browser.span(text: "More").click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      attempts += 1
      sleep 1
      retry  if attempts < 5
      raise "Selenium error"
    end
    reviews = browser.div(id: "REVIEWS").html
    parsed_reviews = Nokogiri.parse(reviews)
    10.times do |index|
      remote_id = parsed_reviews.search('.review-container')[index].attributes['data-reviewid'].value.to_i
      TripadvisorReview.create(review_time: parsed_reviews.search('.ratingDate')[index].attributes['title'],
                               rating: parsed_reviews.search('.ui_column.is-9')[index].children.first.attributes['class'].value[-2].to_i,
                               reviewer_username: parsed_reviews.search('.info_text.pointer_cursor > div')[index].text,
                               review_text: parsed_reviews.search('.partial_entry')[index].text,
                               reviewer_image: parsed_reviews.search('.ui_avatar > img')[index].attributes['src'],
                               remote_id: remote_id,
                               restaurant_id: restaurant.id)
    end
  end

  def self.acquire_all_review_urls(restaurant)
    # url here is the first page of the restaurant, which contains reviews, starting from the first ten
    pages = []
    url = restaurant.tripadvisor_url
    serialized = open(url).read
    parsed = Nokogiri.parse(serialized)
    finished = false
    6.times do |index|
      if parsed.search('.pageNumbers > a')[index].nil?
        finished = true
        break
      end
      next unless parsed.search('.pageNumbers > a')[index].attributes['href'] != nil

      next_page = parsed.search('.pageNumbers > a')[index].attributes['href'].value
      new_url = "https://www.tripadvisor.com/#{next_page}"
      pages << new_url
    end
<<<<<<< HEAD

=======

>>>>>>> e970f3efd03b23114b1513416b88860e1f2a5c5d
    until finished do
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
    return pages
  end
end

# rubocop:enable Metrics/LineLength
