class WishlistsController < ApplicationController
  def index
        @wishlists = current_user.wishlists.all
    end

    def new
        @wishlists = Cart.new
    end


    def create

        @wishlists = current_user.wishlists.new(product_id: params[:product_id])
        @wishlists.save
        redirect_to homes_path
    
    end

    def destroy
        @wishlist = current_user.wishlists.find(params[:id])
        @wishlist.destroy
        redirect_to homes_path
    end

end
