class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :name
      t.string :street1
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.integer :phone
      t.timestamps
    end
  end
end