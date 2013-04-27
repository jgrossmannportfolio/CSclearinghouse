class Project < ActiveRecord::Base
	attr_accessible :title, :body, :description, :owner, :deadline, :tag_ids
	has_and_belongs_to_many :tags
	belongs_to :user
end
