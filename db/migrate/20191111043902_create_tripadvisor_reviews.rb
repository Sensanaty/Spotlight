class CreateTripadvisorReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :tripadvisor_reviews do |t|
      t.string :reviewer_image
      t.string :reviewer_username
      t.string :reviewer_profile_url
      t.string :review_text
      t.float :rating
      t.integer :review_time

      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
