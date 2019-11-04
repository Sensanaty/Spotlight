class CreateReviewsGoogles < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews_googles do |t|
      t.references :restaurant, foreign_key: true
      t.string :review_user
      t.string :review_user_profile_image
      t.string :review_user_profile_url
      t.text :review_content
      t.float :review_rating
      t.integer :review_timestamp
      t.string :review_image
      t.string :review_url

      t.timestamps
    end
  end
end
