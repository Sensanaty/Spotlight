class AddReviewStatsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :yelp_review_count, :text
    add_column :restaurants, :yelp_average_rating, :text
    add_column :restaurants, :google_review_count, :text
    add_column :restaurants, :google_average_rating, :text
    add_column :restaurants, :foursquare_review_count, :text
    add_column :restaurants, :foursquare_average_rating, :text
    add_column :restaurants, :tripadvisor_review_count, :text
    add_column :restaurants, :tripadvisor_average_rating, :text
  end
end
