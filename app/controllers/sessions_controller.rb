class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
	end

	def destroy
		log_out
		redirect_to root_url
	end
end
