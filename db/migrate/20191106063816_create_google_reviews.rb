class CreateGoogleReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :google_reviews do |t|
      t.string :formatted_address
      t.float :latitude
      t.float :longitude
      t.string :name
      t.float :rating
      t.string :reviews
      t.string :types
      t.integer :user_ratings_total
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
