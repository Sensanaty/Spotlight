class AddLinkedChannelsToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :linked_channels, :text
  end
end
