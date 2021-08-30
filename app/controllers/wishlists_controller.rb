class WishlistsController < ApplicationController
    def index 
    end

    def show 
        @wishlist = current_wishlist
        @wishlist_items = @wishlist.wishlist_items
    end

    def edit
        @wishlist = current_wishlist
    end

    def update
        @wishlist = current_wishlist 
        if @wishlist.update(wishlist_params)
            redirect_to wishlist_path
        else
            render :edit
        end
    end

    private
    def wishlist_params
        params.require(:wishlist).permit(wishlist_items_attributes: [:id, :quantity, :_destroy])
    end
end
