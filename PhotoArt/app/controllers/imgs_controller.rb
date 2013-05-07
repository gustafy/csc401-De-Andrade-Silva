class ImgsController < ApplicationController

	respond_to :html, :xml, :js

	def create

		@user = User.find(params[:user_id])
		@img = @user.imgs.new(params[:img])

		if @img.save
			flash[:notification] = "Img uploades."
			redirect_to user_url(@user)
		else
			flash[:error] = "Img not uploades."
			redirect_to user_url(@user)
		end

	end

end
