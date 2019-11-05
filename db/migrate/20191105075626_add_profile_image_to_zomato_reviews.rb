class AddProfileImageToZomatoReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :zomato_reviews, :profile_image, :string
  end
end
