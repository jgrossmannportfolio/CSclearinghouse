class UsersController < ApplicationController
	before_filter :auth_user
	before_filter :confirmed_user, :except => [:index, :create, :new, :destroy]
	def index 
		@users = User.where("users.confirmed_at IS NOT NULL")
	end
	
	def show
		id = params[:id]
		@user = User.find(id)
		@edit_and_delete = (@user == current_user)
	end
	
	def edit
		id = params[:id]
		@user = User.find(id)
		@tags = @user.tags
	end

	def new
	end

	#def create
	#	@user = User.create!(params[:user])
   # 	flash[:notice] = "Congratulations #{@user.username}! You have
   # 	sucessfully registered to the CS clearinghouse!"
   # 	redirect_to users_path
	#end

	def update
	    @user = User.find params[:id]
	    @user.update_attributes!(params[:user])
			if(params[:tags] != nil)
				tags = params[:tags].keys
				tags.each do |tag|
					@user.tags.find_by_name(tag).delete
				end
			end
			if(params[:tag][:name] != '' && params[:tag][:name] != nil)
				@user.tags.create!(params[:tag])
			end
			@tags = @user.tags
	    flash[:notice] = "#{@user.username}'s profile was successfully updated."
	    redirect_to edit_user_path(@user)
  	end

	def destroy
    @user = User.find(params[:id])
		if @notification = @user.admin_notification
			@notification.destroy
		end
    @user.destroy
    flash[:notice] = "#{@user.username} deleted."
    redirect_to users_path
  end
end

