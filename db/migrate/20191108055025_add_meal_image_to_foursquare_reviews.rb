class AddMealImageToFoursquareReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :foursquare_reviews, :meal_image, :string
  end
end
