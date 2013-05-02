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
	@notification = AdminNotification.create!(:message => "#{user.firstname} #{user.lastname} wants to post a new project: '#{project.title}'. Confirme or deny the project please!", :admin_type => "project")
	project.admin_notification = @notification
	project.save!
end

def self.confirm_project(params)
		@project = Project.find(params[:project])
		if params[:status] == "true"
			@project.confirmed_at = Time.now
			@project.save!
		else
			@project.destroy
		end
end
	def deadlineslash
		self.deadline.to_formatted_s(:slash)
	end
end
