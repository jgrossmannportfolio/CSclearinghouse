class Notification < ActiveRecord::Base
  attr_accessible :message, :type, :admin_type, :subject, :user_id, :from
	belongs_to :user

	def self.welcome_message(user)
		Notification.create!(:message => "Welcome to CSclearinghouse!", :subject => 'Welcome', :from => 'CSclearinghouse')
	end

	def self.notify_user_project_status(project, status)
		@user = project.user
		if(status == 'approved')
			@message = "Your project: '#{project.title}' has been approved by an administrator! It will now appear on the website."
			@subject = "Project Approved"
		else
			@message = "Your project: '#{project.title}' has been denied by an administrator! You should receive an email from the administrator informing you of the reason for the project being denied."
			@subject = "Project Denied"
		end
		@from = 'Automated'
		@notification = Notification.create!(:from => @from, :subject => @subject, :message => @message)
		@user.notifications << @notification
	end

	def self.notify_user_project_interest(params)
		@project_owner = params[:project].user
		@user = current_user
		@link = link_to "#{@user.username}", user_path(@user) 
		@message = "#{@link} is interested in your project: #{params[:project].title}"
		@subject = "Interest in #{params[:project]}"
		@from = params[:project].user
		@notification = Notification.create!(:from => @from, :subject => @subject, :message => @message)
		@project_owner.notifications << @notification
		flash[:notice] = "#{@project_owner} was just sent a notification of your interest."
	end

	def self.owner_notify_user_interest(params)
		@project = Project.find(params[:project])
		@owner = @project.user
		@user = User.find(params[:user])
		@message = "#{@user.username} wants you to work on their project: '#{@project.title}'!"
		@subject = "Are you interested?"
		@from = @owner
		@notification = Notification.create!(:from => @from, :subject => @subject, :message => @message)
		@user.notifications << @notification
	end
end
