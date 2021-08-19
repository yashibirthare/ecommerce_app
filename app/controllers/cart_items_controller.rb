class CartItemsController < ApplicationController
	def create
		# product = Product.find(params[:product_id])
		current_cart = @current_cart

		@cart_item = CartItem.new
		@cart_item.cart = current_cart
    	# @cart_item.product = product

    	@cart_item.save
    	redirect_to homes_path

	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:product_id, :cart_id)
	end
end
