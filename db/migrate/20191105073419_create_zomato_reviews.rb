class CreateZomatoReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :zomato_reviews do |t|
      t.string :review_title
      t.text :review_text
      t.integer :rating
      t.string :review_time
      t.string :reviewer

      t.timestamps
    end
  end
end
