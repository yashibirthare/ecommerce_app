class CartsController < ApplicationController
    def index
        @carts = current_user.carts.all
        @products = Product.all
    end

    def new
        @carts = Cart.new
    end


    def create

        @carts = current_user.carts.build()
        @carts.save
        redirect_to homes_path
    
    end

    def destroy
        @cart = current_user.carts.find(params[:id])
        @cart.destroy
        redirect_to homes_path
    end

end
