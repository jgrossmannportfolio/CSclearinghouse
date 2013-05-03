class NotificationsController < ApplicationController
	before_filter :auth_user
	def index
		@user = current_user
		@notifications = @user.notifications
	end
	
	def show   
	end
	
	def new
	end

	def create
	end

  def edit
  end

  def update 
	end

	def destroy
    @notification = Notification.find(params[:id])
		@user = @notification.user
    @notification.destroy
		redirect_to(notifications_path)
  end
end
