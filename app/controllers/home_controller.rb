class HomeController < ApplicationController

	def index
		@projects = Project.find(:all, :order => "RANDOM()").take(5)
	end
end
		


