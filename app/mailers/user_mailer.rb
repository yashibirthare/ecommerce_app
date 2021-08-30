class UserMailer < ApplicationMailer
	def wishlist_email
		@user = params[:user]
		@url = "http://localhost:3000/"
		mail(to: @user.email, subject: "Your wishlist is available now")
	end
end
