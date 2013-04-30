class AdminNotification < Notification
	attr_accessible :user_id, :project_id
	belongs_to :user
end
