class UsersController < ApplicationController
before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
		redirect_to user_path(current_user) if @user != current_user
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user.save
        flash[:notice] = " You have updated user successfully. "
        redirect_to user_path(@user.id)
        else
        flash[:notice] = "error"
        render :edit
        end
	end


	def index
		@user = current_user
		@book = Book.new
		@users = User.all
	end

	def new
		@book = Book
	end

	def authenticate_user
		if @current_user == nil
		   redirect_to ("/")
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end