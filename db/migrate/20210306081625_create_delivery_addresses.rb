class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :post_code,        null: false
      t.integer :place_id,        null: false
      t.string :municipality,     null: false
      t.string :address,          null: false
      t.string :building
      t.string :telephone_number, null: false
      t.references :order, null: false
      t.timestamps
    end
  end
end
