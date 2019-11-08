class CreateFoursquareReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :foursquare_reviews do |t|
      t.string :reviewer_image
      t.text :review_text
      t.integer :review_time
      t.string :reviewer_username
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
