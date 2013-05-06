class HomeController < ApplicationController

	def index
		@projects = Project.order("created_at DESC").first(3)
	end
end
		


