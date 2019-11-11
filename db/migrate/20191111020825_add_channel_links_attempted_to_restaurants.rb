class AddChannelLinksAttemptedToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :channel_links_attempted, :string
  end
end
