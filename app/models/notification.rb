class Notification < ActiveRecord::Base
  attr_accessible :message, :type, :admin_type
end
