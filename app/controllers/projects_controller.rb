class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end
	
	def show   
		id = params[:id]
    	@project = Project.find(id)		
	end
	
	def new
	end

	def create
		@project = Project.create!(params[:project])
    	flash[:notice] = "#{@project.title} was successfully created."
    	redirect_to projects_path
	end

	def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "#{@project.title} deleted."
    redirect_to projects_path
  end
end
