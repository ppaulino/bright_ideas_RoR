class LikesController < ApplicationController
	def create
		Like.create(user: User.find(session[:user_id]), post:Post.find(params[:id]))
		redirect_to request.referer
	end
	def destroy
		Post.find(params[:id]).destroy
		redirect_to request.referer	
	end
end
