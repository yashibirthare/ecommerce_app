class CartsController < ApplicationController
    def index 
    end
    def show 
        @cart = current_cart
        @cart_items = @cart.cart_items
    end

    def edit
        @cart = current_cart
        @cart_item = @cart.cart_items.find_by(id: params[:cart_id])
    end

end
