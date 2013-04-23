class UsersController < ApplicationController

	respond_to :html, :xml, :js

	def index
		respond_with(@users = User.all)
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "User created."
			redirect_to user_url(@user)
		else
			flash[:error] = "User not created, try again."
			redirect_to new_user_url(@user)
		end
	end

	def show
		@user = User.find(params[:id])
		@img = @user.imgs.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user]) 	
			flash[:notice] = "User updated."
			redirect_to user_path(@user)
		else
			flash[:error] = "User not updated."
			redirect_to edit_user_path(@user)
		end	
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy	
			flash[:notice] = "User deleted."
			redirect_to users_url
		else
			flash[:error] = "User not deleted."
			redirect_to users_url
		end	
	end

end
