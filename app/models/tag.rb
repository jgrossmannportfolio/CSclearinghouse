class Tag < ActiveRecord::Base
	attr_accessible :name, :project_ids, :user_ids
	has_and_belongs_to_many :projects
	has_and_belongs_to_many :users
end
