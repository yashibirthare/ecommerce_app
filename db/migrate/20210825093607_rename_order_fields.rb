class RenameOrderFields < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :cart_item_id, :user_id
  end
end
