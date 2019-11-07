class FixYelpAndZomatoColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :yelp_reviews, :user_image, :reviewer_image
    rename_column :yelp_reviews, :profile_url, :reviewer_profile_url
    rename_column :yelp_reviews, :user_name, :reviewer_username
  
    rename_column :zomato_reviews, :reviewer, :reviewer_username
    rename_column :zomato_reviews, :profile_image, :reviewer_image
  end
end
