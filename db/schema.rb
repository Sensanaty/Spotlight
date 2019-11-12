# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_12_025822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foursquare_reviews", force: :cascade do |t|
    t.string "reviewer_image"
    t.text "review_text"
    t.string "reviewer_username"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meal_image"
    t.datetime "review_time"
    t.index ["restaurant_id"], name: "index_foursquare_reviews_on_restaurant_id"
  end

  create_table "google_reviews", force: :cascade do |t|
    t.string "reviewer_image"
    t.string "reviewer_username"
    t.string "reviewer_profile_url"
    t.string "review_text"
    t.float "rating"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "review_time"
    t.index ["restaurant_id"], name: "index_google_reviews_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "date"
    t.float "vat"
    t.float "order_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurant_reviews", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "review_type"
    t.bigint "review_id"
    t.integer "review_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
    t.index ["restaurant_id"], name: "index_restaurant_reviews_on_restaurant_id"
    t.index ["review_type", "review_id"], name: "index_restaurant_reviews_on_review_type_and_review_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.string "cuisine"
    t.integer "price_level"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.text "linked_channels"
    t.text "yelp_id"
    t.text "zomato_id"
    t.text "tripadvisor_id"
    t.text "google_id"
    t.text "foursquare_id"
    t.text "facebook_id"
    t.text "instagram_id"
    t.string "channel_links_attempted"
    t.text "yelp_review_count"
    t.text "yelp_average_rating"
    t.text "google_review_count"
    t.text "google_average_rating"
    t.text "zomato_review_count"
    t.text "zomato_average_rating"
    t.text "foursquare_review_count"
    t.text "foursquare_average_rating"
    t.text "tripadvisor_review_count"
    t.text "tripadvisor_average_rating"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "tripadvior_reviews", force: :cascade do |t|
    t.string "reviewer_image"
    t.string "reviewer_username"
    t.string "reviewer_profile_url"
    t.string "review_text"
    t.float "rating"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "review_time"
    t.index ["restaurant_id"], name: "index_tripadvior_reviews_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "subscription_status"
    t.date "subscription_expiry_date"
    t.text "google_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.string "photo"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yelp_reviews", force: :cascade do |t|
    t.string "reviewer_image"
    t.string "reviewer_username"
    t.string "reviewer_profile_url"
    t.string "review_text"
    t.float "rating"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "review_time"
    t.index ["restaurant_id"], name: "index_yelp_reviews_on_restaurant_id"
  end

  create_table "zomato_reviews", force: :cascade do |t|
    t.string "reviewer_image"
    t.string "reviewer_username"
    t.string "reviewer_profile_url"
    t.string "review_text"
    t.float "rating"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "review_time"
    t.index ["restaurant_id"], name: "index_zomato_reviews_on_restaurant_id"
  end

  add_foreign_key "foursquare_reviews", "restaurants"
  add_foreign_key "google_reviews", "restaurants"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurant_reviews", "restaurants"
  add_foreign_key "restaurants", "users"
  add_foreign_key "tripadvior_reviews", "restaurants"
  add_foreign_key "yelp_reviews", "restaurants"
  add_foreign_key "zomato_reviews", "restaurants"
end
