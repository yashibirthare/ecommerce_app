class CheckoutsController < ApplicationController
	
	def new
		@cart = current_cart
		@cart_items = @cart.cart_items
		product = @cart_items.map(&:total_price).sum * 100
		@order = Razorpay::Order.create(amount: product.to_i,currency: "INR",receipt: "receipt_001")	
	end
	
end