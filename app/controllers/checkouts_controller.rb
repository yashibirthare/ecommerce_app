class CheckoutsController < ApplicationController
	require 'easypost'
	EasyPost.api_key = 'EZTKa2e2c4cb9a784e6c93fb7ea2c0268adfWsbDQtaZS2RgHjDFUooIYg'
	

	def new
		@shipment = EasyPost::Shipment.retrieve(params[:id])
		@shipment_rates = @shipment.lowest_rate
		@shipment_amount = @shipment_rates["id"].to_i
		@cart = current_cart
		@cart_items = @cart.cart_items	
		product = @cart_items.map(&:total_price).sum * 100 + @shipment_amount
		@order = Razorpay::Order.create(amount: product.to_i,currency: "INR",receipt: "receipt_001")	
		@shipment.buy(:rate => @shipment.lowest_rate)
		@shipment.insure(amount: 100)
	end
	
	def confirm_payment
		shipping_address = current_user.shipping_address
		if shipping_address.present?
			to_address = FetchCheckoutService.new.create_address(shipping_address)
			parcel = FetchCheckoutService.new.create_parcel
			customs_item = FetchCheckoutService.new.create_customs_item
			customs_info = FetchCheckoutService.new.create_customs_info(customs_item)
			@shipment = FetchCheckoutService.new.create_shipment(to_address,parcel,customs_info)
			@shipment_rates = @shipment.lowest_rate
		else
			redirect_to user_profile_path(current_user)
		end
	end
end