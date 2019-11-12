# rubocop:disable Metrics/LineLength

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'

class TripadvisorScraperService

  def self.scrape_tripadvisor(url)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto(url)
    browser.span(text: "More").click
    parsed_url = Nokogiri.parse(URI.open(browser.html))
    puts parsed_url.at('div.entry').children
    # puts parsed_url
    # puts "review_text: #{parsed_url.search('.partial_entry')}"
    # puts "review_time: #{parsed_url.search('.ratingDate')[0].attributes['title']}"
    # puts "rating: #{parsed_url.search('.ui_column.is-9')[0].children.first.attributes['class'].value[-2].to_i}"
    # puts "reviewer_username: #{parsed_url.search('.memberOverlayLink > .info_text.pointer_cursor')[0].children.first.text}"
    # counter = 0
    # 10.times do
    # TripadvisorReview.create(review_time: parsed_url.search('.ratingDate')[counter].attributes['title'],
    #                          rating: parsed_url.search('.ui_column.is-9')[0].children.first.attributes['class'].value[-2].to_i,
    #                          reviewer_username: parsed_url.search('.memberOverlayLink > .info_text.pointer_cursor')[counter].children.first.text,
    #                          )
    # review.rating_time = parsed_url.search('.ratingDate')[counter].attributes['title']
    # review.title = parsed_url.search('.noQuotes')[counter].text.strip
    # review.review_link = parsed_url.search('.ui_column.is-9 div a')[counter].attributes['href'].value
    # review.reviewer = parsed_url.search('.memberOverlayLink > .info_text.pointer_cursor')[counter].children.first.text
    # rate = parsed_url.search('.ui_column.is-9')[0].children.first.attributes['class'].value
    # this returns a string like "ui_bubble_rating bubble_10" / 20 / 30 / 40 / 50 depending on the star rating
    # review.rating = rate[-2].to_i
    # review.save
    #   counter += 1
    # end
  end
end

#   def acquire_all_review_urls
#     # url here is the first page of the restaurant, which contains reviews, starting from the first ten
#     pages = []
#     url = params[:url]
#     serialized = open(url).read
#     parsed = Nokogiri.parse(serialized)
#
#     6.times do
#       next unless parsed.search('.pageNumbers > a')[page].attributes['href'] != nil
#
#       next_page = parsed.search('.pageNumbers > a')[page].attributes['href'].value
#       new_url = "https://www.tripadvisor.com/#{next_page}"
#       pages << new_url
#     end
#
#     finished = false
#
#     until finished do
#       url = pages[-1]
#       serialized = open(url).read
#       parsed = Nokogiri.parse(serialized)
#       if parsed.search('.pageNumbers > a').size < 9
#         finished = true
#         next_page = parsed.search('.pageNumbers > a')[-3].attributes['href'].value
#         new_url = "https://www.tripadvisor.com/#{next_page}"
#         next_page2 = parsed.search('.pageNumbers > a')[-2].attributes['href'].value
#         new_url2 = "https://www.tripadvisor.com/#{next_page2}"
#         next_page3 = parsed.search('.pageNumbers > a')[-1].attributes['href'].value
#         new_url3 = "https://www.tripadvisor.com/#{next_page3}"
#         pages << new_url
#         pages << new_url2
#         pages << new_url3
#       else
#         next_page = parsed.search('.pageNumbers > a')[-4].attributes['href'].value
#         new_url = "https://www.tripadvisor.com/#{next_page}"
#         next_page2 = parsed.search('.pageNumbers > a')[-3].attributes['href'].value
#         new_url2 = "https://www.tripadvisor.com/#{next_page2}"
#         pages << new_url
#         pages << new_url2
#       end
#     end
#   end
# end

# rubocop:enable Metrics/LineLength
