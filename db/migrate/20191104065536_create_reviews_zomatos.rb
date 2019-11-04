class CreateReviewsZomatos < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews_zomatos do |t|
      t.references :restaurant, foreign_key: true
      t.text :review_content
      t.float :review_rating

      t.timestamps
    end
  end
end
