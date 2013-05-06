class AdminNotificationsController < ApplicationController
	def index
	end
	
	def show   
	end
	
	def new
	end

	def create
		@notification= AdminNotification.create!(params[:notification])
	end

  def edit
  end

  def update
	end

	def destroy
    @notification = AdminNotification.find(params[:id])
		if params[:type] == "user"
			User.confirm_user(params)
		end
		if params[:type] == "project"
			Project.confirm_project(params)
		end
    @notification.destroy
		redirect_to(params[:path])
  end
end
