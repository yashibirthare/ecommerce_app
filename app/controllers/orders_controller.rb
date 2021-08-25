class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index  
        @orders = current_user.orders.includes(:order_items)
    end

    def create
        payment = Razorpay::Payment.fetch(params[:payment_id])
        if payment.status == 'captured'
            @order = Order.new
            @order.user_id = current_user.id
            @order.payment_id = payment.id
            @order.amount = params[:amount]
            @order.status = "captured"
            if @order.save
                @items = current_cart.cart_items 
                @items.each do |item|
                    @order_item = OrderItem.new
                    @order_item.order_id = @order.id
                    @order_item.product_id = item.product_id
                    @order_item.quantity = item.quantity
                    @order_item.total_amount = @order.amount 
                    if @order_item.save
                        item.destroy
                    end
                end
                redirect_to homes_path
            end
        else
            render :json
        end
    end

    private
    def order_params
        params.require(:order).permit(:payment_id, :amount, :status)
    end
end
