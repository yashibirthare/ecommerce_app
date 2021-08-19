class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?

   	before_action :current_cart

  	private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
  
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :profile_img, :address])
   	end

end
