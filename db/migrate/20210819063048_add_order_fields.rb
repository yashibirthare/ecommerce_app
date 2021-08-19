class AddOrderFields < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cart_id, :integer
    add_column :orders, :payment_id, :integer
    add_column :orders, :amount, :decimal
    add_column :orders, :quantity, :integer
    add_column :orders, :status, :string
      
  end
end
