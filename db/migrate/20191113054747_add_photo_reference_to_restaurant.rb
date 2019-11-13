class AddPhotoReferenceToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :photo_reference, :string
  end
end
