class AddChannelIdsToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :yelp_id, :text
    add_column :restaurants, :zomato_id, :text
    add_column :restaurants, :tripadvisor_id, :text
    add_column :restaurants, :google_id, :text
    add_column :restaurants, :foursquare_id, :text
    add_column :restaurants, :facebook_id, :text
    add_column :restaurants, :instagram_id, :text
  end
end
