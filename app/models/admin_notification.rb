class AdminNotification < Notification
	attr_accessible :user_id, :project_id, :admin_type
	belongs_to :user
	belongs_to :project

	def self.user_destroy_message(user)
		self.create!(:message => "#{user.username} has removed his/her account from CSclearinghouse", :subject => 'Account Removal', :from => 'Automated', :admin_type => 'general')
	end

	def self.project_destroy_message(project)
		self.create!(:message => "'#{project.title}' has been deleted by the project owner: #{project.user}", :subject => "Project Deletion", :from => "Automated", :admin_type: => 'general')
end
