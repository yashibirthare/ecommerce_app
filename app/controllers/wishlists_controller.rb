class WishlistsController < ApplicationController
  def index
        
        
    end

    def create

        @wishlists = current_user.wishlists.new(product_id: params[:product_id])
        @wishlists.save
        redirect_to homes_path
    
    end

end
