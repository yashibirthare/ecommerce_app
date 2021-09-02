class CheckoutsController < ApplicationController
	require 'easypost'
	EasyPost.api_key = 'EZTKa2e2c4cb9a784e6c93fb7ea2c0268adfWsbDQtaZS2RgHjDFUooIYg'
	
	def new
		@cart = current_cart
		@cart_items = @cart.cart_items	
		product = @cart_items.map(&:total_price).sum * 100
		@order = Razorpay::Order.create(amount: product.to_i,currency: "INR",receipt: "receipt_001")	
	end
	
	def shipping
		@current_user = current_user
		to_address = EasyPost::Address.create(:name => @current_user.name,:street1 => @current_user.address,:city => @current_user.address,:state => 'MP',:zip => '452002',:country => 'IN',:phone => @current_user.phone)
		from_address = EasyPost::Address.create(:company => 'EasyPost',:street1 => '118 2nd Street',:street2 => '4th Floor',:city => 'San Francisco',:state => 'CA',:zip => '94105',:phone => '415-456-7890')
		parcel = EasyPost::Parcel.create(:width => 15.2,:length => 18,:height => 9.5,:weight => 35.1)
		customs_item = EasyPost::CustomsItem.create(:description => 'EasyPost T-shirts',:quantity => 2,:value => 25.12,:weight => 33,:origin_country => 'in',:hs_tariff_number => 123456)
		customs_info = EasyPost::CustomsInfo.create(:integrated_form_type => 'form_2976',:customs_certify => true,:customs_signer => 'Dr. Pepper',:contents_type => 'gift',:eel_pfc => 'NOEEI 30.37(a)',:non_delivery_option => 'abandon',:restriction_type => 'none',:restriction_comments => '',:customs_items => [customs_item])
		shipment = EasyPost::Shipment.create(to_address: to_address,from_address: from_address,parcel: parcel)
	end
end
