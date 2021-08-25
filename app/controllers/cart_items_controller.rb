class CartItemsController < ApplicationController
  

  def create
    product = Product.find_by(id: params[:product_id])  
    if product.present?
      @cart = Cart.find_or_initialize_by(user_id: current_user.id)
      @cart.save
      @cart_item = product.cart_items.find_or_initialize_by(cart_id: @cart.id)
      @cart_item.quantity = params[:quantity] 
      if @cart_item.save
        redirect_to homes_path  
      else
        redirect_to homes_path
      end  
    else     
      redirect_to homes_path
    end
  end
                                                                                                 
  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
  end

end
