class Product < ApplicationRecord
	has_and_belongs_to_many :categories
	has_many :wishlist_items
	has_many :wishlists, through: :wishlist_items
	has_many :cart_items
	has_many :carts, through: :cart_items
	has_many :order_items

end
