class AddPhotoToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :photo, :string
  end
end
