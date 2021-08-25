class CreateWishlistItems < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlist_items do |t|
      t.integer :quantity
      t.decimal :total_amount
      t.references :product, index: true, foreign_key: true
      t.references :wishlist, index: true, foreign_key: true
      t.timestamps
    end
  end
end
