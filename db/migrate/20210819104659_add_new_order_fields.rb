class AddNewOrderFields < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :order_id, :integer
    remove_column :carts, :product_id
    remove_column :carts, :quantity

    remove_column :orders, :product_id
    remove_column :orders, :user_id

  end
end
