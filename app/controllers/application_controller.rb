class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?

   
  
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :profile_img, :address])
   	end

end
