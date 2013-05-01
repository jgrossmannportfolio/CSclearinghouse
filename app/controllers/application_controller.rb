class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :sign_in_status_message

	def auth_user
		redirect_to new_user_session_path unless user_signed_in?
	end

	def sign_in_status_message
		if user_signed_in?
			@sign_in_status = "Signed in as #{current_user.username}"
		else
			@sign_in_status = "Currently not signed in"
		end
	end

end
