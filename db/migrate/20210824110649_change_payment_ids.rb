class ChangePaymentIds < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :payment_id
    add_column :orders, :payment_id, :string
  end
end
