class NotificationsController < ApplicationController
	def index
		@notifications = Notification.all
	end
	
	def show   
		id = params[:id]
    @notification = Notification.find(id)	
	end
	
	def new
	end

	def create
		@notification= Notification.create!(params[:notification])
	end

  def edit
      @notification = Notification.find params[:id] 
  end

  def update
      @notification = Notification.find params[:id] 
      @notification.update_attributes! params[:notification] 
	end

	def destroy
    @notification = Notification.find(params[:id])
		@user = @notification.user
		if params[:status] == "true"
			User.confirm_user(@user)
		else
			@user.destroy
		end
    @notification.destroy
		redirect_to(params[:path])
  end
end
