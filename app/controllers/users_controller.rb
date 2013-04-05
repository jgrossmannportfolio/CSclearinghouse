class UsersController < ApplicationController
	def index 
		@users = User.all
	end
	
	def show
		id = params[:id]
		@user = User.find(id)
	end
	
	def edit
		id = params[:id]
		@user = User.find(id)
	end

	def new
	end

	def create
		@user = User.create!(params[:user])
    	flash[:notice] = "Congratulations #{@user.username}! You have
    	sucessfully registered to the CS clearinghouse!"
    	redirect_to users_path
	end

	def update
	    @user = User.find params[:id]
	    @user.update_attributes!(params[:user])
	    flash[:notice] = "#{@user.username}'s profile was successfully updated."
	    redirect_to user_path(@user)
  	end

	def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.username} deleted."
    redirect_to users_path
  end
end

