class Product < ApplicationRecord
	after_update :quantity_update
	has_and_belongs_to_many :categories
	has_many :wishlist_items
	has_many :wishlists, through: :wishlist_items
	has_many :cart_items
	has_many :carts, through: :cart_items
	has_many :order_items

	def quantity_update
		if saved_change_to_attribute?(:quantity) && attribute_before_last_save(:quantity) == 0 && quantity > 0
			@wishlists = self.wishlists
      		@wishlists.each do |wishlist|
        		UserMailer.with(user: wishlist.user).wishlist_email.deliver_later
      		end
		end
	end
end
