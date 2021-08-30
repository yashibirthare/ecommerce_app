class NewOrderFields < ActiveRecord::Migration[6.1]
  def change
    add_column :wishlist_items, :order_id, :integer
  end
end
