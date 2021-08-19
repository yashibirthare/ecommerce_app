class AddNewOrderFields < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :cart_id, :user_id
    add_column :orders, :product_id, :integer
  end
end
