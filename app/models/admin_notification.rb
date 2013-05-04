class AdminNotification < Notification
	attr_accessible :user_id, :project_id, :admin_type
	belongs_to :user
	belongs_to :project

	def self.user_destroy_message(user)
		self.create!(:message => "#{user.username} has removed his/her account from CSclearinghouse", :subject => 'Account Removal', :from => 'Automated', :admin_type => 'general')
	end

	def self.project_destroy_message(project)
		self.create!(:message => "'#{project.title}' has been deleted by the project owner: #{project.user.username}", :subject => "Project Deletion", :from => "Automated", :admin_type => 'general')
	end

	def self.new_user_message(user)
		self.create!(:message => "#{user.firstname} #{user.lastname} wishes to register for the CSclearinghouse! Confirm or deny the account please!", :admin_type => "user", :subject => "New User", :from => user.username)
	end

	def self.new_project_message(user, project)
		self.create!(:message => "#{user.firstname} #{user.lastname} wants to post a new project: '#{project.title}'. Confirm or deny the project please!", :admin_type => "project", :subject => "New Project", :from => user.username)
	end
end
