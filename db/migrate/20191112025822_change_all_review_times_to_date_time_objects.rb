class ChangeAllReviewTimesToDateTimeObjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :google_reviews, :review_time
    add_column :google_reviews, :review_time, :datetime

    remove_column :foursquare_reviews, :review_time
    add_column :foursquare_reviews, :review_time, :datetime

    remove_column :tripadvior_reviews, :review_time
    add_column :tripadvior_reviews, :review_time, :datetime

    remove_column :yelp_reviews, :review_time
    add_column :yelp_reviews, :review_time, :datetime

    remove_column :zomato_reviews, :review_time
    add_column :zomato_reviews, :review_time, :datetime
  end
end
