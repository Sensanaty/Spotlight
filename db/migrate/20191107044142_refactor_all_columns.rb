class RefactorAllColumns < ActiveRecord::Migration[5.2]
  def change
    
    drop_table :google_reviews
    create_table :google_reviews do |t|
      t.string :reviewer_image
      t.string :reviewer_username
      t.string :reviewer_profile_url
      t.string :review_text
      t.float :rating
      t.datetime :review_time
      
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
    
    drop_table :yelp_reviews
    create_table :yelp_reviews do |t|
      t.string :reviewer_image
      t.string :reviewer_username
      t.string :reviewer_profile_url
      t.string :review_text
      t.float :rating
      t.datetime :review_time
  
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
    
    drop_table :zomato_reviews
    create_table :zomato_reviews do |t|
      t.string :reviewer_image
      t.string :reviewer_username
      t.string :reviewer_profile_url
      t.string :review_text
      t.float :rating
      t.datetime :review_time
  
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
    
  end
end
