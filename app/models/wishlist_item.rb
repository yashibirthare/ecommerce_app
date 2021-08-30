class WishlistItem < ApplicationRecord
	belongs_to :product
	belongs_to :wishlist

	def total_price
		self.quantity * self.product.price
	end
end
