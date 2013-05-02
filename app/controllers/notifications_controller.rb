class NotificationsController < ApplicationController
	before_filter :auth_user
	def index
		@user = current_user
		@notifications = @user.notifications
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
    @notification.destroy
		redirect_to(notifications_path)
  end
end
