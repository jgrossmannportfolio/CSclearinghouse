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
		@notification_type = params[:type]
		if @notification_type == 'notify_project_owner_of_interest'
			Notification.notify_user_project_interest(params)
			flash[:notice] = "#{Project.find(params[:project]).user.username} was just sent a notification of your interest."
		elsif @notification_type == 'owner notify user of interest'
			Notification.owner_notify_user_interest(params)
			flash[:notice] = "#{User.find(params[:user]).username} was sent a notification of your interest"
		end
		flash.keep
		redirect_to params[:link]
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
