class Notification < ActiveRecord::Base
  attr_accessible :message, :type, :admin_type, :subject, :user_id, :from
	belongs_to :user
end
