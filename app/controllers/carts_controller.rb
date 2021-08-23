class CartsController < ApplicationController
    def index 
    end
    def show 
        @cart = current_cart
        @cart_items = @cart.cart_items
    end

    def edit
        @cart = current_cart

    end

    def update
        @cart = current_cart 
        if @cart.update(cart_params)
            redirect_to homes_path
        else
            render :edit
        end
    end


    private
    def cart_params
        params.require(:cart).permit(cart_items_attributes: [:id, :quantity, :_destroy])
    end
end
