class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:session][:email], params[:session][:password])
		if user.nil?
			flash[:danger] = "Invalid login. Please try again."
			
			redirect_to root_path
			
		else
			sign_in(user)
			flash[:success] = "You are now logged in."
			redirect_to posts_path
			# redirect_to root_path
		end
	end

	def destroy
		sign_out
		redirect_to root_path
		flash[:success] = "You have successfully signed out."
	end
end