class WishlistItemsController < ApplicationController
	def create
		product = Product.find_by(id: params[:product_id])  
    	if product.present?
      		@wishlist = Wishlist.find_or_initialize_by(user_id: current_user.id)
      		@wishlist.save
      		@wishlist_item = product.wishlist_items.find_or_initialize_by(wishlist_id: @wishlist.id)
      		@wishlist_item.quantity = params[:quantity]
      		if @wishlist_item.save
      			redirect_to wishlists_path
      		else
      			redirect_to homes_path
      		end
      	else
      		redirect_to homes_path
      	end
	end

	private
	def wishlist_item_params
		params.require(:wishlist_item).permit(:product_id, :wishlist_id, :quantity)
	end
end
