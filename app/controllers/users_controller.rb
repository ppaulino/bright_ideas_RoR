class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show]

	def index
		redirect_to root_path
	end

	def new
		redirect_to root_path
	end

	def edit
		redirect_to root_path
	end

	def show
		@current_user = User.find(params[:id])
		@postCounter = User.find(params[:id]).post.count
		@likesCounter = User.find(params[:id]).likes.count
	end

	def create
		@user = User.new(user_params)

		if @user.save
			sign_in(@user)
			flash[:success] = "You are now logged in."
			redirect_to posts_path
		else
			flash[:danger] = @user.errors.full_messages
			redirect_to root_path
		end
		
	end

	def update
		redirect_to root_path
	end

	def destroy
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
		end
end
