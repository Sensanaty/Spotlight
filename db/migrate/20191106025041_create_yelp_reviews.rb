class CreateYelpReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :yelp_reviews do |t|
      t.string :user_name
      t.datetime :review_timestamp
      t.float :rating
      t.text :review
      t.string :user_image
      t.string :profile_url
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
