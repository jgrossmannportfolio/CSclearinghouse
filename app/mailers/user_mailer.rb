class UserMailer < ActionMailer::Base
  default from: "CSclearinghouse480@gmail.com"

	def welcome_email(user)
		@user = user
		@url = "http://radiant-crag-1186.herokuapp.com/users/sign_in"
		mail(:to => @user.email, :subject => "Welcome to CSclearinghouse!")
	end

	def project_interest_email(user, project)
		@user = user
		@project = project
		@owner = project.user
		mail(:to => @owner.email, :subject => "Interest in your project")
	end

	def email_user_for_project(user, project)
		@user = user
		@project = project
		@owner = project.user
		mail(:to => @user.email, :subject => "CSclearinghouse Project opportunity")
	end

	def denied_project_email(user, project)
		@user = user
		@project = project
		mail(:to => @user.email, :subject => "Project denied")
	end
	
	def approved_project_email(user, project)
		@user = user
		@project = project
		mail(:to => @user.email, :subject => "Project Approved")
	end
end
