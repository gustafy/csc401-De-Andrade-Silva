class UsersController < ApplicationController

	respond_to :html, :xml, :js

	def index
		respond_with(@users = User.all)

	end

	def new 
		@user = User.new

    	respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @user }
    	end
	end

	def create
		@user = User.new(params[:user])
 
	    respond_to do |format|
	    if @user.save
	    	format.html { redirect_to(:users, :notice => 'Registration successfull.') }
	    	format.xml { render :xml => @user, :status => :created, :location => @user }
	    else
	    	format.html { render :action => "new" }
	    	format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
	    end
	    end
	end

	def show
		@user = User.find(params[:id])
		@img = @user.imgs.new
		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @user }
	    end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

    	respond_to do |format|
      	if @user.update_attributes(params[:user])
        	format.html { redirect_to @user, notice: 'User was successfully updated.' }
        	format.json { head :no_content }
      	else
        	format.html { render action: "edit" }
        	format.json { render json: @user.errors, status: :unprocessable_entity }
      	end
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
