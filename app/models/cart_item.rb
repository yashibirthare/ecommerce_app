class CartItem < ApplicationRecord
	belongs_to :product
	belongs_to :cart
	validate :check_quantity
	after_save :update_product_quantity
	
	def total_price
		self.quantity * self.product.price
	end
	
	private
	def check_quantity
		if self.quantity > self.product.quantity
			errors.add("Product is not available for your quantity")
		end
	end

	def update_product_quantity
		# byebug
		if saved_change_to_attribute?(:quantity)
			a = attribute_before_last_save(:quantity)
			b = quantity
			d = self.product.quantity
			c = a.nil? ? b : b - a
			new_quantity = d - c
			self.product.update(quantity: new_quantity) 
		end
	end
end