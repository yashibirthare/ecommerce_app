class AddShippingAddressFields < ActiveRecord::Migration[6.1]
  def change
    add_column :shipping_addresses, :user_id, :integer
  end
end
