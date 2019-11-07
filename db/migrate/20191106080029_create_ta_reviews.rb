class CreateTaReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :ta_reviews do |t|
      t.integer :rating
      t.string :review_date
      t.string :reviewer
      t.string :review_title
      t.string :review_link
      t.text :review

      t.timestamps
    end
  end
end