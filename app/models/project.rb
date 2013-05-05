
#require '/home/cosc480/CSclearinghouse/config/initializers/time_formats.rb'

class Project < ActiveRecord::Base
	attr_accessible :title, :body, :description, :owner, :deadline, :tag_ids, :user_id, :confirmed_at
	has_and_belongs_to_many :tags
	belongs_to :user
	has_one :admin_notification, :dependent => :destroy

	def confirmation_required?
		false
	end
	def active_for_authentication?
		confirmed? || confirmation_period_valid?
	end

def self.unconfirmed_project(project, user)
	@notification = AdminNotification.new_project_message(user, project)
	project.admin_notification = @notification
	project.save!
end

def self.confirm_project(params)
		@project = Project.find(params[:project])
		if params[:status] == "true"
			@project.confirmed_at = Time.now
			@project.save!
			Notification.notify_user_project_status(@project, 'approved')
		else
			Notification.notify_user_project_status(@project, 'denied')
			@project.destroy
		end
end

def self.search(search,category)		
	if search
		find(:all, :conditions => ["#{category} LIKE ?","%#{search}%"])
	else
		find(:all)
	end
end


	def deadlineslash
		self.deadline.to_formatted_s(:slash)
	end
end
