class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :cuisine
      t.integer :price_level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
