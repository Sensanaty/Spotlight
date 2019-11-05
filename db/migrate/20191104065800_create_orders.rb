class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.datetime :date
      t.float :vat
      t.float :order_value

      t.timestamps
    end
  end
end
