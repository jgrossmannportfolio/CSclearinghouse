require '/home/cosc480/CSclearinghouse/config/initializers/time_formats.rb'
class Project < ActiveRecord::Base
	attr_accessible :title, :body, :description, :owner, :deadline, :tag_ids, :user_id
	has_and_belongs_to_many :tags
	belongs_to :user
	def deadlineslash
		self.deadline.to_formatted_s(:slash)
	end
end
