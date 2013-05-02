class AdminNotificationsController < ApplicationController
	def index
		@notifications = AdminNotification.all
	end
	
	def show   
		id = params[:id]
    @notification = AdminNotification.find(id)	
	end
	
	def new
	end

	def create
		@notification= AdminNotification.create!(params[:notification])
	end

  def edit
      @notification = AdminNotification.find params[:id] 
  end

  def update
      @notification = AdminNotification.find params[:id] 
      @notification.update_attributes! params[:notification] 
	end

	def destroy
    @notification = AdminNotification.find(params[:id])
		if params[:user]
			User.confirm_user(params)
		end
		if params[:project]
			Project.confirm_project(params)
		end
    @notification.destroy
		redirect_to(params[:path])
  end
end
