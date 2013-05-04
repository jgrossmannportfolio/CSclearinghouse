class Notification < ActiveRecord::Base
  attr_accessible :message, :type, :admin_type, :subject, :user_id, :from
	belongs_to :user

	def self.welcome_message(user)
		Notification.create!(:message => "Welcome to CSclearinghouse!", :subject => 'Welcome', :from => 'CSclearinghouse')
	end

end
