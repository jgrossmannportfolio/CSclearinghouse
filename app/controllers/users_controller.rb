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

	def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.username}'s profile was successfully updated."
    redirect_to user_path(@user)
  end
end

