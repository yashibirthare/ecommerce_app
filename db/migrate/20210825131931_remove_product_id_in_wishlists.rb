class RemoveProductIdInWishlists < ActiveRecord::Migration[6.1]
  def change
    remove_column :wishlists, :product_id
  end
end
