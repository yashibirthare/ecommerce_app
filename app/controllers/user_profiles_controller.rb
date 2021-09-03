class UserProfilesController < ApplicationController
	def show
    	@shipping_address = current_user.shipping_address.present? ? current_user.shipping_address : crrent_user
  	end

  	def shipping_address
  		@shipping_address = ShippingAddress.new(shipping_address_param)
  		@shipping_address.user_id = current_user.id
  		if @shipping_address.save
  			redirect_to user_profile_path
  		else
  			redirect_to homes_path
  		end
  	end

  	private
  	def shipping_address_param
  		params.require(:shipping_address).permit(:name, :street1, :city, :state, :zip, :country, :phone, :user_id)
  	end
end