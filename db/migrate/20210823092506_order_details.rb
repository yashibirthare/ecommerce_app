class OrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :quantity 
    add_column :orders, :cart_item_id, :integer
    add_column :orders, :product_name, :string
  end
end
