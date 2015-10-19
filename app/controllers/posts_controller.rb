class PostsController < ApplicationController
before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show]
  def index
 	@posts = Post.includes(:user)
  end

  def show

  	@post = Post.includes(:user).find(params[:id])
  	@postInfo = Post.find(params[:id]).likes.preload(:user, :post)
  end

  def destroy
  end

  def create
  	User.find(session[:user_id]).post.create(post_params)
  	redirect_to request.referer
  end
  	private
	def post_params
		params.require(:post).permit(:post, :user_id)
	end
end
