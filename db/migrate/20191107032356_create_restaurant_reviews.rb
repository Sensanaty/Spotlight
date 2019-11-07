class CreateRestaurantReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_reviews do |t|
      t.references :restaurant, foreign_key: true
      t.references :review, polymorphic: true, index: true
      t.date :date
      t.timestamps
    end
  end
end
