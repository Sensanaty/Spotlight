class AddRatingsToRestaurantReviewModel < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurant_reviews, :rating, :float
  end
end
