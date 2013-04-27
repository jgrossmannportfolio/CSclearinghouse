class Project < ActiveRecord::Base
	attr_accessible :title, :body, :description, :owner, :deadline, :tag_ids, :user_id
	has_and_belongs_to_many :tags
	belongs_to :user
end
