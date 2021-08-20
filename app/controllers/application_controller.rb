class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	def current_cart
		if current_user
			cart = Cart.find_or_initialize_by(user_id: current_user.id)
            cart.save if cart.new_record?
            cart
		end	
	end  
  
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :profile_img, :address])
   	end

end
