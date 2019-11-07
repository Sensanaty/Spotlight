class CreateRestaurantReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_reviews do |t|
      t.references :restaurant, foreign_key: true
      t.references :review, polymorphic: true, index: true
      t.datetime :reviewtime
      t.timestamps
    end
  end
end
