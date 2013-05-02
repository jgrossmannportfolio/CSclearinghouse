class AdminNotification < Notification
	attr_accessible :user_id, :project_id, :admin_type
	belongs_to :user
	belongs_to :project
end
